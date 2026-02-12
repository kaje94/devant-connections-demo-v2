import ballerina/http;
import ballerina/os;

configurable string ServiceURL = os:getEnv("CHOREO_GET_USERS1_SERVICEURL");
configurable string ChoreoAPIKey = os:getEnv("CHOREO_GET_USERS1_APIKEY");

configurable string? devantProxyHost = ();
configurable int? devantProxyPort = ();
http:ProxyConfig? devantProxyConfig = devantProxyHost is string && devantProxyPort is int ? {host: <string>devantProxyHost, port: <int>devantProxyPort} : ();

configurable string ServiceURL1 = os:getEnv("CHOREO_ENRICHUSERSV2_SERVICEURL");

configurable string smtpHost1 = os:getEnv("CHOREO_EMAILCONNECTION1_SMTPHOST1");
configurable string smtpUserName1 = os:getEnv("CHOREO_EMAILCONNECTION1_SMTPUSERNAME1");
configurable string smtpPassword1 = os:getEnv("CHOREO_EMAILCONNECTION1_SMTPPASSWORD1");
