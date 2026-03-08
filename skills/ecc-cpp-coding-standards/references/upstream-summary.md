---
name: cpp-coding-standards
description: C++ coding standards based on the C++ Core Guidelines (isocpp.github.io). Use when writing, reviewing, or refactoring C++ code to enforce modern, safe, and idiomatic practices.
origin: ECC
---

# C++ Coding Standards (C++ Core Guidelines)

Comprehensive coding standards for modern C++ (C++17/20/23) derived from the [C++ Core Guidelines](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines). Enforces type safety, resource safety, immutability, and clarity.

## When to Use

- Writing new C++ code (classes, functions, templates)
- Reviewing or refactoring existing C++ code
- Making architectural decisions in C++ projects
- Enforcing consistent style across a C++ codebase
- Choosing between language features (e.g., `enum` vs `enum class`, raw pointer vs smart pointer)

### When NOT to Use

- Non-C++ projects
- Legacy C codebases that cannot adopt modern C++ features
- Embedded/bare-metal contexts where specific guidelines conflict with hardware constraints (adapt selectively)

## Cross-Cutting Principles

These themes recur across the entire guidelines and form the foundation:

1. **RAII everywhere** (P.8, R.1, E.6, CP.20): Bind resource lifetime to object lifetime
2. **Immutability by default** (P.10, Con.1-5, ES.25): Start with `const`/`constexpr`; mutability is the exception
3. **Type safety** (P.4, I.4, ES.46-49, Enum.3): Use the type system to prevent errors at compile time
4. **Express intent** (P.3, F.1, NL.1-2, T.10): Names, types, and concepts should communicate purpose
5. **Minimize complexity** (F.2-3, ES.5, Per.4-5): Simple code is correct code
6. **Value semantics over pointer semantics** (C.10, R.3-5, F.20, CP.31): Prefer returning by value and scoped objects

## Philosophy & Interfaces (P.*, I.*)

### Key Rules

| Rule | Summary |
|------|---------|
| **P.1** | Express ideas directly in code |
| **P.3** | Express intent |
| **P.4** | Ideally, a program should be statically type safe |
| **P.5** | Prefer compile-time checking to run-time checking |
| **P.8** | Don't leak any resources |
| **P.10** | Prefer immutable data to mutable data |
| **I.1** | Make interfaces explicit |
| **I.2** | Avoid non-const global variables |
| **I.4** | Make interfaces precisely and strongly typed |
| **I.11** | Never transfer ownership by a raw pointer or reference |
| **I.23** | Keep the number of function arguments low |

### DO

```cpp
// P.10 + I.4: Immutable, strongly typed interface
struct Temperature {
    double kelvin;
};

Temperature boil(const Temperature& water);
```

### DON'T

```cpp
// Weak interface: unclear ownership, unclear units
double boil(double* temp);

// Non-const global variable
int g_counter = 0;  // I.2 violation
```

## Functions (F.*)

### Key Rules

| Rule | Summary |
|------|---------|
| **F.1** | Package meaningful operations as carefully named functions |
| **F.2** | A function should perform a single logical operation |
| **F.3** | Keep functions short and simple |
| **F.4** | If a function might be evaluated at compile time, declare it `constexpr` |
| **F.6** | If your function must not throw, declare it `noexcept` |
| **F.8** | Prefer pure functions |
| **F.16** | For "in" parameters, pass cheaply-copied types by value and others by `const&` |
| **F.20** | For "out" values, prefer return values to output parameters |
| **F.21** | To return multiple "out" values, prefer returning a struct |
| **F.43** | Never return a pointer or reference to a local object |

### Parameter Passing

```cpp
// F.16: Cheap types by value, others by const&
void print(int x);                           // cheap: by value
void analyze(const std::string& data);       // expensive: by const&
void transform(std::string s);               // sink: by value (will move)

// F.20 + F.21: Return values, not output parameters
struct ParseResult {
    std::string token;
    int position;
};

ParseResult parse(std::string_view input);   // GOOD: return struct

// BAD: output parameters
void parse(std::string_view input,
           std::string& token, int& pos);    // avoid this
```

### Pure Functions and constexpr

```cpp
// F.4 + F.8: Pure, constexpr where possible
constexpr int factorial(int n) noexcept {
    return (n <= 1) ? 1 : n * factorial(n - 1);
}

static_assert(factorial(5) == 120);
```

### Anti-Patterns

- Returning `T&&` from functions (F.45)
- Using `va_arg` / C-style variadics (F.55)
- Capturing by reference in lambdas passed to other threads (F.53)
- Returning `const T` which inhibits move semantics (F.49)

## Classes & Class Hierarchies (C.*)

### Key Rules

| Rule | Summary |
|------|---------|
| **C.2** | Use `class` if invariant exists; `struct` if data members vary independently |
| **C.9** | Minimize exposure of members |
| **C.20** | If you can avoid defining default operations, do (Rule of Zero) |
| **C.21** | If you define or `=delete` any copy/move/destructor, handle them all (Rule of Five) |
| **C.35** | Base class destructor: public virtual or protected non-virtual |
| **C.41** | A constructor should create a fully initialized object |
| **C.46** | Declare single-argument constructors `explicit` |
| **C.67** | A polymorphic class should suppress public copy/move |
| **C.128** | Virtual functions: specify exactly one of `virtual`, `override`, or `final` |

### Rule of Zero

```cpp
// C.20: Let the compiler generate special members
struct Employee {
    std::string name;
    std::string department;
    int id;
    // No destructor, copy/move constructors, or assignment operators needed
};
```

### Rule of Five

```cpp
// C.21: If you must manage a resource, define all five
class Buffer {
public:
    explicit Buffer(std::size_t size)
        : data_(std::make_unique<char[]>(size)), size_(size) {}

    ~Buffer() = default;

    Buffer(const Buffer& other)
        : data_(std::make_unique<char[]>(other.size_)), size_(other.size_) {
        std::copy_n(other.data_.get(), size_, data_.get());
    }

    Buffer& operator=(const Buffer& other) {
        if (this != &other) {
            auto new_data = std::make_unique<char[]>(other.size_);
            std::copy_n(other.data_.get(), other.size_, new_data.get());
            data_ = std::move(new_data);
            size_ = other.size_;
        }
        return *this;
    }

    Buffer(Buffer&&) noexcept = default;
    Buffer& operator=(Buffer&&) noexcept = default;

private:
    std::unique_ptr<char[]> data_;
    std::size_t size_;
};
```

### Class Hierarchy

```cpp
// C.35 + C.128: Virtual destructor, use override
class Shape {
public:
    virtual ~Shape() = default;
    virtual double area() const = 0;  // C.121: pure interface
};

class Circle : public Shape {
public:
    explicit Circle(double r) : radius_(r) {}
    double area() const override { return 3.14159 * radius_ * radius_; }

private:
    double radius_;
};
```

### Anti-Patterns

- Calling virtual functions in constructors/destructors (C.82)
- Using `memset`/`memcpy` on non-trivial types (C.90)
- Providing different default arguments for virtual function and overrider (C.140)
- Making data members `const` or references, which suppresses move/copy (C.12)

