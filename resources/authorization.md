---
layout: default
title: Cabify Authorization Resource
---

# Authorization Resource

~~~
https://cabify.com/api/authorization
~~~

Authorization resources are used to grant users access to and perform actions on Cabify API resource endpoints.

## Actions

 * `POST` - log in
 * `GET` - check details are still valid
 * `DESTROY` - log out

## Authentication

Creating a new authorization object (`POST`) requires an Application `client_id` and `secret` to be provided via HTTP Basic Authentication as per the HTTP standard.

When performing other actions, there are two authentication scenarios:

 1. the current user's token requesting their complete authorization resource without an id parameter, and,
 2. using the OAuth Application client id and secret to access the authorization resource previously created with a specific id parameter.

In both cases we perform extra steps to ensure that the client cannot access an authorization they did not create.

## Response

Authorizations are slightly different to other models in the API in that we adapt the format to more closely match the OAuth specifications.

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

