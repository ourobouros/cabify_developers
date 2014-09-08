### Create journey

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat

### Resource URL

GET /api/journey

### Authentication

Auth token... lorem ipsum

### Params

| Name | Type | Description |
| --- | --- | --- |
| start_loc | Array with floats [lon, lat] | Longitude and Latitude of the start location |
| end_loc | Array with floats [lon, lat] | Longitude and Latitude of the end location |
| message (optional) | String | Additional message for the driver |

### Response

{% highlight json %}
{
  "...": "...",
  "...": "..."
}
{% endhighlight %}