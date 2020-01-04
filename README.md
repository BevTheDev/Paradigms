# Paradigms

<p align="left">
 <a href="https://travis-ci.org/BevTheDev/Paradigms" target="_blank"><img src="https://travis-ci.org/BevTheDev/Paradigms.svg?branch=master" alt="Build Status"></a> 
</p>

Example coding/testing patterns to make your life easier.

- [Test Patterns](#test-patterns)
  - [Mock Environment](#mock-environment)

-----

## Test Patterns

### Mock Environment

Functions that use Date() can be difficult to test. Get around this by injecting a mock environment into your tests which will always return a known date.

To start, create an Environment file similar to this:

```swift
struct Environment {
    
    var date: () -> Date = Date.init
}

var Env = Environment()
```

This creates an environment for your project, and defaults the date to the current date.

Now to access the date, rather than invoking `Date()`, instead use `Env.date()`. This functions identically to calling `Date()`, but will allow dependency injection in your unit tests.

In your unit test target, create a MockEnvironment file like this:

```swift
extension Environment {
    
    static let mock = Environment(
        date: {
            return Date(year: 2019, month: 11, day: 12, hour: 2, minute: 45, second: 0, millisecond: 0, timeZone: TimeZone.init(abbreviation: "CST"))
        }
    )
}
```
And inject it in your test setup:

```swift
Env = .mock
```

This sets the environment date to 11/12/19 02:45 CST when tests are running so you can test against that known date.

Example files:
- [Environment.swift](https://github.com/BevTheDev/Paradigms/blob/master/Paradigms/Environment/Environment.swift)
- [MockEnvironment.swift](https://github.com/BevTheDev/Paradigms/blob/master/ParadigmsTests/MockObjects/MockEnvironment.swift)
- [DateExamplesViewController.swift](https://github.com/BevTheDev/Paradigms/blob/master/Paradigms/View%20Controllers/Examples/DateExamplesViewController.swift)
- [DateTests.swift](https://github.com/BevTheDev/Paradigms/blob/master/ParadigmsTests/Dates/DateTests.swift)
