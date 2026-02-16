import ballerina/http;
import ballerina/os;
import ballerina/log;

configurable string ServiceURL = os:getEnv("CHOREO_GET_USERS_SERVICEURL");
configurable string ChoreoAPIKey = os:getEnv("CHOREO_GET_USERS_APIKEY");
configurable string ChoreoAPIKey1= os:getEnv("CHOREO_GET_USERS_CHOREOAPIKEY");

configurable string? devantProxyHost = ();
configurable int? devantProxyPort = ();
http:ProxyConfig? devantProxyConfig = devantProxyHost is string && devantProxyPort is int ? { host: <string> devantProxyHost, port: <int> devantProxyPort } : ();

function init() {
    log:printInfo("=== Configuration Check ===");
    log:printInfo("CHOREO_GET_USERS_APIKEY" + (ChoreoAPIKey.length() > 0 ? "Yes (length: " + ChoreoAPIKey.length().toString() + ")" : "No/Empty"));
    log:printInfo("CHOREO_GET_USERS_CHOREOAPIKEY" + (ChoreoAPIKey1.length() > 0 ? "Yes (length: " + ChoreoAPIKey1.length().toString() + ")" : "No/Empty"));
}