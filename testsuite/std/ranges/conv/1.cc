// { dg-do run { target c++23 } }

// C++23 26.5.7 Range conversions [range.utility.conv]

#include <ranges>
#include <vector>
#include <string>
#include <deque>
#include <list>
#include <forward_list>
#include <map>
#include <testsuite_hooks.h>
#include <testsuite_allocator.h>
#include <testsuite_iterators.h>

void
test_p1206r7_examples()
{
  using Alloc = __gnu_test::uneq_allocator<int>;
  const Alloc alloc(303);
  const std::map<int, const char*> m{{1, "one"}, {2, "two"}, {3, "three"}};
  namespace ranges = std::ranges;

  auto l = std::views::iota(1, 10);
  // create a vector with the elements of l
  auto vec = ranges::to<std::vector<int>>(l); // or vector{std::from_range, l};
  //Specify an allocator
  auto b = ranges::to<std::vector<int, Alloc>>(l, alloc); // or vector{std::from_range, l, alloc};
  //deducing value_type
  auto c = ranges::to<std::vector>(l);
  // explicit conversion int -> long
  auto d = ranges::to<std::vector<long>>(l);
  //Supports converting associative container to sequence containers
  auto f = ranges::to<std::vector>(m);
  //Supports converting sequence containers to associative ones
  auto g = ranges::to<std::map>(f);
  //Pipe syntax
  auto g2 = l | ranges::views::take(42) | ranges::to<std::vector>();
  //Pipe syntax with allocator
  auto h = l | ranges::views::take(42) | ranges::to<std::vector>(alloc);
  //The pipe syntax also support specifying the type and conversions
  auto i = l | ranges::views::take(42) | ranges::to<std::vector<long>>();
  // Nested ranges
  std::list<std::forward_list<int>> lst = {{0, 1, 2, 3}, {4, 5, 6, 7}};
  auto vec1 = ranges::to<std::vector<std::vector<int>>>(lst);
  auto vec2 = ranges::to<std::vector<std::deque<double>>>(lst);

  VERIFY( vec == std::vector<int>(std::ranges::begin(l), std::ranges::end(l)) );
  static_assert(std::is_same_v<decltype(b), std::vector<int, Alloc>>);
  VERIFY( b == (std::vector<int, Alloc>(vec.begin(), vec.end())) );
  VERIFY( b.get_allocator() == alloc );
  static_assert(std::is_same_v<decltype(c), std::vector<int>>);
  VERIFY( c == vec );
  static_assert(std::is_same_v<decltype(d), std::vector<long>>);
  VERIFY( d == std::vector<long>(vec.begin(), vec.end()) );
  VERIFY( g == m );
  static_assert(std::is_same_v<decltype(g2), std::vector<int>>);
  VERIFY( g2 == vec );
  static_assert(std::is_same_v<decltype(h), std::vector<int, Alloc>>);
  VERIFY( h == b );
  VERIFY( h.get_allocator() == alloc );
  VERIFY( i == d );
  static_assert(std::is_same_v<decltype(vec1), std::vector<std::vector<int>>>);
  VERIFY( vec1[1][1] == 5 );
  static_assert(std::is_same_v<decltype(vec2), std::vector<std::deque<double>>>);
  VERIFY( vec2[1][2] == 6.0 );
}

void
test_example_1()
{
  using namespace std;
  using ranges::to;

  // Example 1 from C++23 [range.utility.conv.general]
  string_view str = "the quick brown fox";
  auto words = views::split(str, ' ') | to<vector<string>>();

  VERIFY( (is_same_v<decltype(words), vector<string>>) );
  VERIFY( words == vector<string>({"the", "quick", "brown", "fox"}) );
}

template<typename C>
struct Cont1
{
  template<typename R, typename... Args>
    requires std::constructible_from<C, R&, Args&...>
    Cont1(R&& r, Args&&... args)
    : c(r, args...)
    { }

  typename C::iterator begin();
  typename C::iterator end();

  C c;
};

void
test_2_1_1()
{
  // (2.1.1) constructible_from<C, R, Args...>

  std::vector<int> v{1, 2, 3, 4};
  auto v2 = std::ranges::to<std::vector<int>>(v);
  static_assert(std::is_same_v<decltype(v2), decltype(v)>);
  VERIFY( v2 == v );

  std::initializer_list<int> il{5, 6, 7, 8};
  v2 = std::ranges::to<std::vector<int>>(il);
  VERIFY( v2 == std::vector<int>(il) );

  v2 = std::ranges::to<std::vector<int>>(il, std::allocator<int>{});
  VERIFY( v2 == std::vector<int>(il) );

  using Alloc = __gnu_test::uneq_allocator<int>;
  using V = std::vector<int, Alloc>;

  V v3({10, 11, 12, 13}, Alloc(14));
  auto v4 = std::ranges::to<V>(v3);
  static_assert(std::is_same_v<decltype(v4), V>);
  VERIFY( v4 == v3 );
  VERIFY( v4.get_allocator() == v3.get_allocator() );

  auto v5 = std::ranges::to<V>(v3, Alloc(33));
  VERIFY( v5 == v3 );
  VERIFY( v5.get_allocator() == Alloc(33) );

  auto v6 = std::ranges::to<V>(il, Alloc(44));
  VERIFY( v6 == V(il) );
  VERIFY( v6.get_allocator() == Alloc(44) );

  auto c = std::ranges::to<Cont1<V>>(V{1, 2, 3});
  static_assert(std::is_same_v<decltype(c), Cont1<V>>);
  VERIFY( c.c == V({1, 2, 3}) );

  auto c2 = std::ranges::to<Cont1<V>>(V{4, 5, 6}, Alloc(55));
  static_assert(std::is_same_v<decltype(c2), Cont1<V>>);
  VERIFY( c2.c == V({4, 5, 6}) );
  VERIFY( c2.c.get_allocator() == Alloc(55) );

  auto c3 = std::ranges::to<Cont1<V>>(il, Alloc(66));
  static_assert(std::is_same_v<decltype(c2), Cont1<V>>);
  VERIFY( c3.c == V(v2.begin(), v2.end()) );
  VERIFY( c3.c.get_allocator() == Alloc(66) );
}

template<typename C>
struct Cont2
{
  template<typename R, typename... Args>
    requires std::constructible_from<C, R&, Args&...>
    Cont2(std::from_range_t, R&& r, Args&&... args)
    : c(r, args...)
    { }

  typename C::iterator begin();
  typename C::iterator end();

  C c;
};

void
test_2_1_2()
{
  // (2.1.2) constructible_from<C, from_range_t, R, Args...>

  using Alloc = __gnu_test::uneq_allocator<int>;
  using V = std::vector<int, Alloc>;
  auto c = std::ranges::to<Cont2<V>>(V{1, 2, 3});
  static_assert(std::is_same_v<decltype(c), Cont2<V>>);
  VERIFY( c.c == V({1, 2, 3}) );

  auto c2 = std::ranges::to<Cont2<V>>(V{4, 5, 6}, Alloc(7));
  static_assert(std::is_same_v<decltype(c2), Cont2<V>>);
  VERIFY( c2.c == V({4, 5, 6}) );
  VERIFY( c2.c.get_allocator() == Alloc(7) );
}

template<typename C>
struct Cont3
{
  template<typename It, typename Sent, typename... Args>
    requires std::same_as<It, Sent>
    && std::constructible_from<C, It&, Sent&, Args&...>
    Cont3(It first, Sent last, Args&&... args)
    : c(first, last, args...)
    { }

  typename C::iterator begin();
  typename C::iterator end();

  C c;
};

void
test_2_1_3()
{
  // (2.1.3) constructible_from<C, iterator_t<R>, sentinel_t<R<, Args...>

  using Alloc = __gnu_test::uneq_allocator<int>;
  using V = std::vector<int, Alloc>;

  std::list<unsigned> l{1u, 2u, 3u};
  auto c = std::ranges::to<Cont3<V>>(l);
  static_assert(std::is_same_v<decltype(c), Cont3<V>>);
  VERIFY( c.c == V(l.begin(), l.end()) );

  std::list<long> l2{4l, 5l, 6l};
  auto c2 = std::ranges::to<Cont3<V>>(l2, Alloc(78));
  static_assert(std::is_same_v<decltype(c2), Cont3<V>>);
  VERIFY( c2.c == V(l2.begin(), l2.end()) );
  VERIFY( c2.c.get_allocator() == Alloc(78) );
}

template<typename C, bool UsePushBack = true>
struct Cont4
{
  using value_type = typename C::value_type;

  // Only support construction with no args or an allocator.
  // This forces the use of either push_back or insert to fill the container.
  Cont4() { }
  Cont4(typename C::allocator_type a) : c(a) { }

  // Required to satisfy range
  typename C::iterator begin() { return c.begin(); }
  typename C::iterator end() { return c.end(); }

  // Satisfying container-insertable requires either this ...
  template<typename T>
    requires UsePushBack
    && requires(C& c, T&& t) { c.push_back(std::forward<T>(t)); }
    void
    push_back(T&& t)
    {
      c.push_back(std::forward<T>(t));
      used_push_back = true;
    }

  // ... or this:
  template<typename T>
    typename C::iterator
    insert(typename C::iterator, T&& t)
    {
      used_push_back = false;
      return c.insert(c.end(), std::forward<T>(t));
    }

  // Required to satisfy reservable-container
  void
  reserve(typename C::size_type n) requires requires(C& c) { c.reserve(n); }
  {
    c.reserve(n);
    used_reserve = true;
  }

  // Required to satisfy reservable-container
  auto size() const { return c.size(); }

  // Required to satisfy reservable-container
  auto capacity() const requires requires(C& c) { c.capacity(); }
  { return c.capacity(); }

  // Required to satisfy reservable-container
  auto max_size() const { return c.max_size(); }

  C c;
  bool used_push_back = false;
  bool used_reserve = false;
};

void
test_2_1_4()
{
  // (2.1.4) constructible_from<C, Args...> and
  // container-insertable<C, range_reference_t<R>>

  using Alloc = __gnu_test::uneq_allocator<int>;
  using V = std::vector<int, Alloc>;

  std::list<unsigned> l{1u, 2u, 3u};
  auto c = std::ranges::to<Cont4<V>>(l);
  static_assert(std::is_same_v<decltype(c), Cont4<V>>);
  VERIFY( c.c == V(l.begin(), l.end()) );
  VERIFY( c.used_push_back );
  VERIFY( c.used_reserve );

  std::list<long> l2{4l, 5l, 6l};
  auto c2 = std::ranges::to<Cont4<V>>(l2, Alloc(78));
  static_assert(std::is_same_v<decltype(c2), Cont4<V>>);
  VERIFY( c2.c == V(l2.begin(), l2.end()) );
  VERIFY( c2.c.get_allocator() == Alloc(78) );
  VERIFY( c2.used_push_back );
  VERIFY( c2.used_reserve );

  using Alloc2 = __gnu_test::uneq_allocator<short>;
  using List = std::list<short, Alloc2>;
  auto c3 = std::ranges::to<Cont4<List>>(c.c, Alloc2(99));
  static_assert(std::is_same_v<decltype(c3), Cont4<List>>);
  VERIFY( c3.c == List(l.begin(), l.end()) );
  VERIFY( c3.c.get_allocator() == Alloc(99) );
  VERIFY( c3.used_push_back );
  VERIFY( ! c3.used_reserve );

  auto c4 = std::ranges::to<Cont4<List, false>>(c.c, Alloc2(111));
  static_assert(std::is_same_v<decltype(c4), Cont4<List, false>>);
  VERIFY( c4.c == List(l.begin(), l.end()) );
  VERIFY( c4.c.get_allocator() == Alloc(111) );
  VERIFY( ! c4.used_push_back );
  VERIFY( ! c4.used_reserve );
}

void
test_2_2()
{
  // (2.2) input_range<range_reference_t<R>>

  std::string s1[]{ "one", "two", "three", "four" };
  std::string s2[]{ "V", "VI", "VII", "VIII" };
  std::string s3[]{ "0x09", "0x0a", "0x0b", "0x0c" };
  using R = __gnu_test::test_input_range<std::string>;
  R input_ranges[]{R(s1), R(s2), R(s3)};
  __gnu_test::test_input_range<R> rr(input_ranges);
  namespace pmr = std::pmr;
  __gnu_test::memory_resource res;
#if _GLIBCXX_USE_CXX11_ABI
  auto vvs = std::ranges::to<pmr::vector<pmr::vector<pmr::string>>>(rr, &res);
  auto str_alloc = pmr::polymorphic_allocator<char>(&res);
#else
  auto vvs = std::ranges::to<pmr::vector<pmr::vector<std::string>>>(rr, &res);
  auto str_alloc = std::allocator<char>();
#endif
  VERIFY( vvs[1][1] == "VI" );
  VERIFY( vvs[2][2] == "0x0b" );
  VERIFY( vvs[0].get_allocator().resource() == &res );
  VERIFY( vvs[2][2].get_allocator() == str_alloc );
}

void
test_lwg3984()
{
  std::vector<std::vector<int>> v;
  auto r = std::views::all(std::move(v));
  auto l = std::ranges::to<std::list<std::list<int>>>(r);
  VERIFY(l.empty());
}

void
test_nodiscard()
{
  std::vector<int> v;
  std::ranges::to<std::vector<long>>(v); // { dg-warning "ignoring return" }
  std::ranges::to<std::vector>(v);       // { dg-warning "ignoring return" }
  std::ranges::to<std::vector<long>>();  // { dg-warning "ignoring return" }
  std::ranges::to<std::vector>();        // { dg-warning "ignoring return" }
}

int main()
{
  test_p1206r7_examples();
  test_example_1();
  test_2_1_1();
  test_2_1_2();
  test_2_1_3();
  test_2_1_4();
  test_2_2();
  test_lwg3984();
  test_nodiscard();
}
