prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.04.04'
,p_release=>'18.1.0.00.45'
,p_default_workspace_id=>7092061575067756
,p_default_application_id=>104
,p_default_owner=>'CCPAV'
);
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_jet_waterfall
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(107091424214348169)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.JET.WATERFALL'
,p_display_name=>'JET Waterfall Chart'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'[require jet]#PLUGIN_FILES#waterfallChart.js',
''))
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
' * render - function to create placeholder div tag, and initialise the  component',
' */',
' function render ',
'( p_region                in  apex_plugin.t_region',
', p_plugin                in  apex_plugin.t_plugin',
', p_is_printer_friendly   in  boolean ',
') return apex_plugin.t_region_render_result ',
'is',
'  c_region_static_id      constant varchar2(255)  := apex_escape.html_attribute( p_region.static_id );',
'begin',
'  -- Add placeholder div',
'  sys.htp.p (',
'     ''<div class="a-JET-PictoChart" id="'' || c_region_static_id || ''_region">'' ||',
'       ''<div class="a-JET-PictoChart-container" id="'' || c_region_static_id || ''_chart" style="max-width:600px;width:100%;height:350px;" ></div>'' ||',
'     ''</div>'' );',
'     ',
'  -- Initialize the chart',
'  apex_javascript.add_onload_code',
'  ( p_code => ''jet.waterfall.init(''||',
'                  ''"#''||c_region_static_id||''_chart", ''          || -- pRegionId',
'                  ''"'' || apex_plugin.get_ajax_identifier ||''"''   || -- pApexAjaxIdentifier',
'                 '')''',
'  );',
'  ',
'  return null;',
'end render;',
'',
'/*',
' * ajax - function to process SQL query, and output JSON data for legend',
' */',
'function ajax',
'( p_region    in  apex_plugin.t_region',
', p_plugin    in  apex_plugin.t_plugin ',
') return apex_plugin.t_region_ajax_result',
'is',
'  c       sys_refcursor;',
'  l_query varchar2(32767);',
'begin  ',
'  l_query := p_region.source;',
'  open c for l_query;',
'  apex_json.open_object;',
'  apex_json.write(''items'', c);',
'',
'  -- add settings',
'  apex_json.write(''animationOnDisplay'' , p_region.attribute_01);',
'  apex_json.write(''columnCount''        , p_region.attribute_02);',
'  apex_json.write(''layout''             , p_region.attribute_03);',
'',
'  apex_json.close_object;',
'  return null;',
'end ajax;',
''))
,p_api_version=>1
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL'
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0.0'
,p_files_version=>131
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(107241515162112061)
,p_plugin_id=>wwv_flow_api.id(107091424214348169)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'animationOnDisplay'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_default_value=>'auto'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(107241938486113000)
,p_plugin_attribute_id=>wwv_flow_api.id(107241515162112061)
,p_display_sequence=>10
,p_display_value=>'auto'
,p_return_value=>'auto'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(107242433406114099)
,p_plugin_attribute_id=>wwv_flow_api.id(107241515162112061)
,p_display_sequence=>20
,p_display_value=>'popIn'
,p_return_value=>'popIn'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(107242764332114853)
,p_plugin_attribute_id=>wwv_flow_api.id(107241515162112061)
,p_display_sequence=>30
,p_display_value=>'alphaFade'
,p_return_value=>'alphaFade'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(107243215318115454)
,p_plugin_attribute_id=>wwv_flow_api.id(107241515162112061)
,p_display_sequence=>40
,p_display_value=>'zoom'
,p_return_value=>'zoom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(107243586663115964)
,p_plugin_attribute_id=>wwv_flow_api.id(107241515162112061)
,p_display_sequence=>50
,p_display_value=>'none'
,p_return_value=>'none'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(107244169419121756)
,p_plugin_id=>wwv_flow_api.id(107091424214348169)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'columnCount'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_show_in_wizard=>false
,p_default_value=>'5'
,p_display_length=>3
,p_max_length=>3
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(107245328789128067)
,p_plugin_id=>wwv_flow_api.id(107091424214348169)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'layout'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_default_value=>'horizontal'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(107245906144128493)
,p_plugin_attribute_id=>wwv_flow_api.id(107245328789128067)
,p_display_sequence=>10
,p_display_value=>'vertical'
,p_return_value=>'vertical'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(107246308298129248)
,p_plugin_attribute_id=>wwv_flow_api.id(107245328789128067)
,p_display_sequence=>20
,p_display_value=>'horizontal'
,p_return_value=>'horizontal'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(53989057920991145)
,p_plugin_id=>wwv_flow_api.id(107091424214348169)
,p_name=>'SOURCE_SQL'
,p_sql_min_column_count=>1
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename||'' - ''||job||''@''||dname "name"',
'             ,      ''human'' "shape"',
'             ,      count(*) over (partition by job) "count"',
'             ,      case job',
'                    when ''PRESIDENT'' then ''black''',
'                    when ''ANALYST''   then ''blue''',
'                    when ''CLERK''     then ''green''',
'                    when ''MANAGER''   then ''red''',
'                    when ''SALESMAN''  then ''yellow''',
'                    end "color"',
'             from   emp',
'                    join dept on emp.deptno = dept.deptno',
'             order by emp.job;'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '212066756E6374696F6E20286A65742C20242C207365727665722C207574696C2C20646562756729207B0A202020202275736520737472696374223B0A0A202020206A65742E776174657266616C6C203D207B0A2020202020202020696E69743A206675';
wwv_flow_api.g_varchar2_table(2) := '6E6374696F6E202870526567696F6E49642C207041706578416A61784964656E74696669657229207B0A20202020202020202020202072657175697265285B226F6A732F6F6A636F7265222C20226A7175657279222C20276F6A732F6F6A636861727427';
wwv_flow_api.g_varchar2_table(3) := '2C20276F6A732F6F6A6C6567656E64275D2C2066756E6374696F6E20286F6A2C202429207B0A202020202020202020202020202020200A202020202020202020202076617220636F6C6F7248616E646C6572203D206E6577206F6A2E436F6C6F72417474';
wwv_flow_api.g_varchar2_table(4) := '72696275746547726F757048616E646C657228293B0A202020202020202020202020636F6C6F7248616E646C65722E6164644D6174636852756C65282D312C20272365643636343727293B0A202020202020202020202020636F6C6F7248616E646C6572';
wwv_flow_api.g_varchar2_table(5) := '2E6164644D6174636852756C6528312C20272336386331383227293B0A2020202020200A2020202020202020202020207661722076616C756573203D205B5D3B0A2020202020202020202020207661722067726F757073203D205B5D3B0A0A2020202020';
wwv_flow_api.g_varchar2_table(6) := '2020202020202076617220637265617465576174657266616C6C44617461203D2066756E6374696F6E202876616C7329207B0A20202020202020202020202020202020202020207661722064617461203D205B5D3B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(7) := '2020202020207661722076616C756573203D2076616C732E736C69636528293B0A202020202020202020202020202020202020202076616C7565732E756E73686966742876616C735B305D293B0A2020202020202020202020202020202020202020666F';
wwv_flow_api.g_varchar2_table(8) := '7220287661722069203D20303B2069203C2076616C7565732E6C656E6774683B20692B2B29207B0A202020202020202020202020202020202020202020202020766172206974656D733B0A20202020202020202020202020202020202020202020202069';
wwv_flow_api.g_varchar2_table(9) := '66202869203D3D3D2076616C7565732E6C656E677468202D2031207C7C2069203D3D3D203029207B0A202020202020202020202020202020202020202020202020202020206974656D73203D207B686967683A2076616C7565735B695D2C206C6F773A20';
wwv_flow_api.g_varchar2_table(10) := '302C20636F6C6F723A20636F6C6F7248616E646C65722E67657456616C75652830292C2073686F7274446573633A202256616C75653A2022202B2076616C7565735B695D7D3B0A2020202020202020202020202020202020202020202020207D0A202020';
wwv_flow_api.g_varchar2_table(11) := '202020202020202020202020202020202020202020656C7365207B0A202020202020202020202020202020202020202020202020202020207661722064696666203D2076616C7565735B69202B20315D202D2076616C7565735B695D3B0A202020202020';
wwv_flow_api.g_varchar2_table(12) := '202020202020202020202020202020202020202020206974656D73203D207B6C6F773A2076616C7565735B695D2C20686967683A2076616C7565735B69202B20315D2C20636F6C6F723A20636F6C6F7248616E646C65722E67657456616C756528646966';
wwv_flow_api.g_varchar2_table(13) := '66202F204D6174682E616273286469666629292C2073686F7274446573633A20224368616E67653A2022202B20646966667D3B0A2020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(14) := '2020646174612E70757368286974656D73293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020202020202072657475726E20646174613B0A2020202020202020202020207D0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(15) := '200A2020202020202020202020207365727665722E706C7567696E287041706578416A61784964656E7469666965722C207B7D2C207B0A20202020202020202020202020202020737563636573733A2066756E6374696F6E2028704461746129207B0A20';
wwv_flow_api.g_varchar2_table(16) := '2020202020202020202020202020200A2020202020202020202020202020202020202020766172206A4461746120203D202070446174612E6974656D733B0A20202020202020202020202020202020202020200A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(17) := '20202020666F722028766172206A20696E206A4461746129207B0A0A20202020202020202020202020202020202020202020202076616C7565732E70757368286A446174615B6A5D2E76616C7565293B0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(18) := '202020202067726F7570732E70757368286A446174615B6A5D2E67726F7570293B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020766172207265666572656E63654F626A65637473203D205B';
wwv_flow_api.g_varchar2_table(19) := '7B6974656D733A2076616C7565732C20747970653A20276C696E65272C206C696E65547970653A20277365676D656E746564272C206C696E6557696474683A20312C206C696E655374796C653A2027646F74746564272C20636F6C6F723A202723383038';
wwv_flow_api.g_varchar2_table(20) := '303830272C2073686F7274446573633A2027436F6E6E656374696E67204C696E65277D5D3B0A2020202020202020202020202020202020202020766172206C6567656E6453656374696F6E73203D205B7B6974656D733A205B7B636F6C6F723A20636F6C';
wwv_flow_api.g_varchar2_table(21) := '6F7248616E646C65722E67657456616C75652831292C20746578743A2022496E637265617365222C2069643A2022496E637265617365227D2C200A20202020202020202020202020202020202020202020202020202020202020202020202020207B636F';
wwv_flow_api.g_varchar2_table(22) := '6C6F723A20636F6C6F7248616E646C65722E67657456616C7565282D31292C20746578743A20224465637265617365222C2069643A20224465637265617365227D2C200A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(23) := '2020202020207B636F6C6F723A20636F6C6F7248616E646C65722E67657456616C75652830292C20746578743A2022546F74616C222C2069643A2022546F74616C227D5D7D5D3B0A0A20202020202020202020202020202020202020207661722069746D';
wwv_flow_api.g_varchar2_table(24) := '73203D20637265617465576174657266616C6C446174612876616C756573293B20200A2020202020202020202020202020202020202020242870526567696F6E4964292E6F6A4368617274287B747970653A2027626172272C0A20202020202020202020';
wwv_flow_api.g_varchar2_table(25) := '202020202020202020202020202020202020202020202020202020202020202022616E696D6174696F6E2D6F6E2D646973706C6179223A226175746F22202C200A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(26) := '2020202020202022794178697322203A207B227265666572656E63652D6F626A65637473223A7265666572656E63654F626A656374737D2C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202022';
wwv_flow_api.g_varchar2_table(27) := '7374796C652D64656661756C7473223A207B22646174612D6974656D2D67617073223A2230227D202C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020206C6567656E643A7B73656374696F6E73';
wwv_flow_api.g_varchar2_table(28) := '3A6C6567656E6453656374696F6E737D2C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202067726F7570733A67726F757073202C0A202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(29) := '2020202020202020202020202020202020207365726965733A5B7B6974656D733A2069746D732C20646973706C6179496E4C6567656E643A20226F6666227D5D7D293B0A202020202020202020202020202020207D0A2020202020202020202020207D29';
wwv_flow_api.g_varchar2_table(30) := '3B0A0A2020202020202020202020207D293B0A20202020202020207D0A202020207D0A7D2877696E646F772E6A6574203D2077696E646F772E6A6574207C7C207B7D2C20617065782E6A51756572792C20617065782E7365727665722C20617065782E75';
wwv_flow_api.g_varchar2_table(31) := '74696C2C20617065782E6465627567293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(107222126280582516)
,p_plugin_id=>wwv_flow_api.id(107091424214348169)
,p_file_name=>'waterfallChart.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
