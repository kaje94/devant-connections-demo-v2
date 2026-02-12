import ballerina/http;
import ballerina/os;

configurable string choreoapikey = os:getEnv("CHOREO_GET_USERS_APIKEY");
configurable string serviceurl = os:getEnv("CHOREO_GET_USERS_SERVICEURL");

configurable string? devantProxyHost = ();
configurable int? devantProxyPort = ();
http:ProxyConfig? devantProxyConfig = devantProxyHost is string && devantProxyPort is int ? {host: <string>devantProxyHost, port: <int>devantProxyPort} : ();

configurable string enrichUserSvcUrl = os:getEnv("CHOREO_ENRICHUSERSCONNECTION_ENRICHUSERSVCURL");

configurable string smtpHost = os:getEnv("CHOREO_EMAILCONNECTION_SMTPHOST");
configurable string smtpUserName = os:getEnv("CHOREO_EMAILCONNECTION_SMTPUSERNAME");
configurable string smtpPassword = os:getEnv("CHOREO_EMAILCONNECTION_SMTPPASSWORD");
configurable string smtpPort = os:getEnv("CHOREO_EMAILCONNECTION_SMTPPORT");
