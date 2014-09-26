---
layout: default
title: Cabify API Overview
---

Cabify API Overview
===================

This section describes the rules and general layout of the Cabify API. If you have any problems or requests, please contact our [development team](mailto:dev@cabify.com).

Current Version
---------------

We do not require any specific version of the API to provided in the requests. Our aim is try and avoid such complications and ensure all resources maintain backwards compatibility.

Schema
------

Access to the API is only permitted via HTTPS to the `cabify.com` domain. All data must be sent and received using JSON with the few notable exceptions of some OAuth authentication requests which accept regular www form data.

All requests to the api include the `/api` path. Any URL that does not include this is likely to be related to a web site that may be visited by a user.

Any properties that end in an `_at` suffix will be provided in ISO 8601 format in UTC including miliseconds:

~~~
YYYY-MM-DDTHH:MM:SS.mmmZ
~~~

Some resources also provide dates in a local time zone in addition to a regular timestamp. These properties typically end in `in_time_zone` or just `in_tz`.

~~~
2012-05-09T13:11:45.000+02:00
~~~


REST and Resources
------------------

The complete Cabify API follows strict REST concepts of resources.



