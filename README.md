# Oracle APEX Region Plugin - Watterfall Chart 
Region Plugin to demonstrate the integration of JET Charts in APEX.


## Changelog

#### 1.0.0 - Initial Release


## Install

- Import Plugin File **region_type_plugin_com_oracle_apex_jet_waterfall.sql** from the main directory into your Application
- (Optional) Deploy the JS file from the **server/js** Directory on your Webserver and change the **File Prefix** to Webservers Folder.


## Plugin Settings

The implemented Plugin Settings (you could at many more):

## How to use
- Create a new Region based on the Plugin
- Add a SQL Statement like the example below. As this is the easiest example possible, you have to name the columns exactly like the example (both naming and lowercase). These column aliases are used to construct the correct JSON object.

Note :  the cloumn alias has to be "group" and "value"

```
select   sum(salary) "value" , 
          TO_CHAR(DATE, 'Month YYYY ')  "group"
       from   hist
order by 2 
```

## Demo Application


## Blogpost


## Preview
## ![](https://github.com/shibins/apex-plugin-chart-waterfall/raw/master/preview.png)
