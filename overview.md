---
layout: default
title: Cabify API Overview
---

Cabify API Overview
===================

This section describes the rules and general layout of the Cabify API. If you have any problems or requests, please contact our [development team](mailto:dev@cabify.com).

Current Version
---------------

We do not require any specific version of the API. Our aim is try and avoid complications and ensure all resources maintain backwards compatibility both on create and retrieval.

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

The complete Cabify API follows strict REST concepts of resources. A resource is and end-point or URL path on which JSON documents can be created, retrieved, updated, and destroyed using HTTP commands.

The following table describes how the different HTTP actions correspond to activity on a resource end-point:

<table class="table">
  <thead>
    <tr>
      <th>GET</th>
      <th>POST</th>
      <th>PUT</th>
      <th>PATCH</th>
      <th>DELETE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Fetch a document</td>
      <td>Create a new document without an ID</td>
      <td>Replace or create a new document with a specific ID</td>
      <td>Update a subset of existing document attribtues</td>
      <td>Destroy the document completely</td>
    </tr>
  </tbody>
</table>

Each resource path may contain an ID parameter on the end. Actions that fetch, modify or replace a resource such as GET, PUT, PATCH and DELETE typically require an id parameter to be present. Exceptions exist for resources that are unique to the user's connection and will be clearly defined in the documentation.

The Cabify API does not distinguish collections and single items, each are considered independent resources. You won't for example find documentation regarding journey lists in the journey resource.


