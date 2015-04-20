openbravo Cookbook
==================
Installs and configures openbravo

e.g.
#### openbravo::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openbravo']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### openbravo::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `openbravo` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openbravo]"
  ]
}
```

License
-------

```text
Copyright 2015, Cloudenablers

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
