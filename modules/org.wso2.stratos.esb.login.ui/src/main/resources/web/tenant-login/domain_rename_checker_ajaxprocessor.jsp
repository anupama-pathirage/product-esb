<!--
 ~ Copyright (c) 2005-2010, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 ~
 ~ WSO2 Inc. licenses this file to you under the Apache License,
 ~ Version 2.0 (the "License"); you may not use this file except
 ~ in compliance with the License.
 ~ You may obtain a copy of the License at
 ~
 ~    http://www.apache.org/licenses/LICENSE-2.0
 ~
 ~ Unless required by applicable law or agreed to in writing,
 ~ software distributed under the License is distributed on an
 ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 ~ KIND, either express or implied.  See the License for the
 ~ specific language governing permissions and limitations
 ~ under the License.
 -->
<%@ page import="com.wso2.carbon.gaas.login.ui.utils.TenantConfigUtil" %><%
/* this script is used to alter the old registrants to */
String domain = request.getParameter("domain");

try {
    if (TenantConfigUtil.isDomainRegistered(domain, config, session)) {
%>
----success----
<%
    }
    else {
        String trialDomain = domain + "-trial";
        if (TenantConfigUtil.isDomainRegistered(trialDomain, config, session)) {
%>
----trial----
<%
        }
        else {
%>
----failed----
<%
        }
    }
} catch (Exception e) {
%>
----failed----
<%
}
%>
