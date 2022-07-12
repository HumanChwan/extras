#include <map>
#include <ostream>
#include <set>
#include <tuple>
#include <type_traits>
#include <vector>

#define DEBUG(kek) \
	std::cerr << "\n\033[1;31mDEBUG: \033[0;31m{ " << #kek << " = " << kek \
         << "}\033[0m\n"

void DEBUG_CERR () {
	return;
}
template <typename Front, typename... Rest>
void DEBUG_CERR(Front kek, Rest... rest) {
	std::cerr << kek << " ";
	DEBUG_CERR(rest...);
}

template <typename T1, typename T2>
std::ostream& operator<<(std::ostream& os, std::pair<T1, T2> a) {
	os << "{" << a.first << ", " << a.second << "}";
	return os;
}

template <typename T>
std::ostream& operator<<(std::ostream& os, std::vector<T>& a) {
	os << "[ ";
	for (T x : a)
		os << x << " ";
	os << "]";
	return os;
}

template <typename T>
std::ostream& operator<<(std::ostream& os, std::set<T>& a) {
	os << "[ ";
	for (T x : a)
		os << x << " ";
	os << "]";
	return os;
}

template <typename T1, typename T2>
std::ostream& operator<<(std::ostream& os, std::map<T1, T2>& a) {
	os << "[ ";
	for (std::pair<T1, T2>& x : a)
		os << x << " ";
	os << "]";
	return os;
}

template <size_t i = 0, typename... tuple_types>
typename std::enable_if<i == sizeof...(tuple_types), void>::type 
tuple_log(std::ostream& os, std::tuple<tuple_types...> t) {
	return;
}

template <size_t i = 0, typename... tuple_types>
typename std::enable_if<i < sizeof...(tuple_types), void>::type 
tuple_log(std::ostream& os, std::tuple<tuple_types...> t) {
	os << std::get<i>(t);
	if (i + 1 == sizeof...(tuple_types))
		return;
	os << ", ";
	tuple_log<i + 1>(os, t);
}

template <typename... tuple_types>
std::ostream& operator<<(std::ostream& os, std::tuple<tuple_types...> t) {
	os << "( ";
	tuple_log(os, t);
	os << " )";
	return os;
}

