<p align="left">
 <a href="https://travis-ci.com/BevTheDev/Paradigms/" target="_blank"><img src="https://travis-ci.com/BevTheDev/Paradigms.svg?branch=master" alt="Build Status"></a> 
</p>

Example coding/testing patterns to make your life easier.

- [Test Patterns](#test-patterns)
  - [Mock Environment](#mock-environment)
  - [Stub Network Requests](#stub-network-requests)

-----

# Test Patterns

## Mock Environment

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

## Stub Network Requests

Use a pod like [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs) to stub network requests so you can test outgoing request format and response handling.

Check out [NetworkMocker.swift](https://github.com/BevTheDev/Paradigms/blob/master/ParadigmsTests/Network%20Mocks/NetworkMocker.swift) for an example of the basic setup. 

Generally, it's a good idea to start off your tests with ALL requests stubbed to a generic failure response. This way, you'll know if you've missed a stub somewhere (it's not a good thing if your tests end up being dependent on real web data).

```swift
static func stubAllRequestsWithFailure() {

    let stubAllBlock: OHHTTPStubsTestBlock = { _ -> Bool in
        return true
    }

    let standardResponseBlock: OHHTTPStubsResponseBlock = { _ -> OHHTTPStubsResponse in
         return OHHTTPStubsResponse(jsonObject: ["stub": "This request has been stubbed"], statusCode: 500, headers: nil)
    }

    OHHTTPStubs.stubRequests(passingTest: stubAllBlock, withStubResponse: standardResponseBlock)
}
```

Once that is in place, you can override the stubs you want with methods similar to this:

```swift
static func stubPostsRequest() {

    stub(forPath: "/posts", responseFileName: "posts_response.json")
}
```

OHHTTPStubs automatically uses the most recent stub set for a request, so we don't have to worry about it accidentally using the error stub we set up before.

In your test tear down, clean up your stubs with:
```swift
OHHTTPStubs.removeAllStubs()
```

Example files:
- [NetworkMocker.swift](https://github.com/BevTheDev/Paradigms/blob/master/ParadigmsTests/Network%20Mocks/NetworkMocker.swift)
- [NetworkMocker+Posts.swift](https://github.com/BevTheDev/Paradigms/blob/master/ParadigmsTests/Network%20Mocks/NetworkMocker%2BPosts.swift)
- [PostsVCTests.swift](https://github.com/BevTheDev/Paradigms/blob/master/ParadigmsTests/Posts/PostsVCTests.swift)
