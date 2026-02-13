import ballerina/http;
import ballerina/os;

configurable string ServiceURL = os:getEnv("CHOREO_GET_USERS_SERVICEURL");
configurable string ChoreoAPIKey = os:getEnv("CHOREO_GET_USERS_APIKEY");

configurable string? devantProxyHost = ();
configurable int? devantProxyPort = ();
http:ProxyConfig? devantProxyConfig = devantProxyHost is string && devantProxyPort is int ? {host: <string>devantProxyHost, port: <int>devantProxyPort} : ();

configurable string ServiceURL1 = os:getEnv("CHOREO_USERENRICHERSVC_SERVICEURL");

configurable string smtpHost = os:getEnv("CHOREO_EMAILCONNECTION_SMTPHOST");
configurable string smtpUsername = os:getEnv("CHOREO_EMAILCONNECTION_SMTPUSERNAME");
configurable string smtpPassword = os:getEnv("CHOREO_EMAILCONNECTION_SMTPPASSWORD");
