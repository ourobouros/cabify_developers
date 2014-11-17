---
layout: default
title: Cabify Authentication
---

# Authentication

Cabify uses [OAuth 2.0](http://oauth.net/2/) outlined in [RFC 6749](http://tools.ietf.org/html/rfc6749) to control access to resources on the server via the API.

If you have not used OAuth 2.0 in the past, we recommend reading a few guides. [Digital Ocean's Introduction to OAuth 2.0](https://www.digitalocean.com/community/tutorials/an-introduction-to-oauth-2) and [Aaron Parecki's "OAuth 2 Simplified"](http://aaronparecki.com/articles/2012/07/29/1/oauth2-simplified) are both great resources to get started.

The Cabify API has been designed with three application access scenarios in mind:

 1. Server application accessing the API for a single user.
 2. Server + client application with multiple users.
 3. JavaScript client-side application with multiple users.

Each of these scenarios is covered in this page so you can pick the most appropriate for your situation.


## Application Registration

Before accessing the Cabify API, you must have first registered your application. At the moment we are only accepting new application requests via email, please [get in touch!](mailto:dev@cabify.com)

The details we require:

 * application name and logo URL,
 * application website,
 * a brief description of what your application will do so we can assign the correct scopes,
 * the email address of a Cabify user responsible for the application, and,
 * an OAuth redirect or callback URL.

Upon successful registration, you'll receive a `client_id` and `secret`. Depending on the grant type your application uses, you'll need to provide at least one of these fields when requesting authorisation of a user.


## Scenario 1: Server Applications

If your application is only ever going to be used by yourself, a colleague, or a special Cabify user you created to act as an intermediary, there is no reason to code a full OAuth solution for external users.

We'd expect this scenario to be used by client's who want to automate the ordering of vehicles for their company or for reselling Cabify services. If your situation is the later, please be sure to have told us your intentions so we can double check for any legal implications.

The process is simple:

 1. Request a new Authorization object using the OAuth `password` grant type.
 2. Extract and save the token from the response object.
 3. Perform requests setting the token in the `Authorization` HTTP header.

**IMPORTANT NOTE**: *Due to potential security implications and unless agreed by Cabify, only the owner of the application defined during registration will be allowed to authenticate using the password grant type.*

### Requesting an Authorization Object

Requests for an authorization object should be sent as a POST request to the Cabify API endpoint:

~~~
https://cabify.com/api/authorization
~~~

Requests should be sent with the following data:

 * a HTTP Basic Authorization header from your `client_id` and `secret` keys, and,
 * a web form encoded parameter list in the post body including the `grant_type` set to `password`, a `username` parameter with your Cabify email address, and `password` set to your account's password.

Here is an example sent from the command line using cURL:

{% highlight bash %}
$ curl -X POST -H "Authorization: Basic YmNkYzEyMzdkYzUzNDM0YTg5M2M2ZWY0NGZiMjVmNGE6aFJoMXIxMXhaZDZTd3NlMG5zOGtjUQ==" -d "grant_type=password&username=sam@cabify.com&password=cabifyftw" https://cabify.com/api/authorization
{% endhighlight %}

If the request fails, you'll receive a `401 Unauthorized` response including a JSON encoded error message as defined by the OAuth 2.0 RFC:

{% highlight json %}
{"error":"unauthorized_client"}
{% endhighlight %}

If successful, the http response will be `200 OK` and you should receive a response similar to:

{% highlight json %}
{
  "_id": "b855493a18275c4a512c52bab043d914",
  "token_type": "Bearer",
  "access_token": "1IIwOxm_32LbIBbamnAg9pJtNstahPvNThkelKDUPCQ",
  "description": "Cabify's Test App",
  "scope": "",
  "grant_type": "password",
  "app": {
    "client_id": "bcdc1237dc53434a893c6ef44fb25f4a",
    "name": "Cabify's Test App",
    "homepage_url": "http://www.cabify.com"
  },
  "created_at": "2014-11-17T14:27:33.731Z",
  "updated_at": "2014-11-17T14:27:33.731Z"
}
{% endhighlight %}

The key fields to extract from the authentication object are the `token_type` and `access_token`, we recommend however that you store the entire object for future use.

### Testing Authorization

Now that we have a token, the process of sending requests to the Cabify API is simple. All requests should include the token type and access token in the HTTP headers in the Authorization header:

~~~
Authorization: Bearer 1IIwOxm_32LbIBbamnAg9pJtNstahPvNThkelKDUPCQ
~~~

We can test this out again with cURL in this simple request for the user's profile:

{% highlight bash %}
$ curl -X GET -H "Authorization: Bearer 1IIwOxm_32LbIBbamnAg9pJtNstahPvNThkelKDUPCQ" https://cabify.com/api/user
{% endhighlight %}

Assuming all okay, you should receive a `200 OK` response with the User's profile in JSON. 

## Scenario 2: Server + Client Applications

TODO!

## Scenario 3: User Agent Client-Side Applications

TODO!

