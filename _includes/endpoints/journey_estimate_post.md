### Journey Estimate

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat

### Resource URL

POST /api/journey/estimate

### Authentication

None

### Params

| Name | Type | Description |
| --- | --- | --- |
| start_loc (optional if start_name is present) | Array with floats [lon, lat] | Longitude and Latitude of the start location |
| end_loc (optional if end_name is present) | Array with floats [lon, lat] | Longitude and Latitude of the end location |
| start_name (optional if start_loc is present) | String | Address of start point |
| end_name (optional if end_loc is present) | String | Address of end point |
| start_type (optional, default: asap) | String | Start type (asap or reserved) |
| start_at (optional) | Time | Time when the reservation should start |
| vehicle_type_id | String | Id of vehicle type |

### Response

{% highlight json %}
{
  "...": "...",
  "...": "..."
}
{% endhighlight %}
