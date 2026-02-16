import ballerina/http;
import ballerina/os;
import ballerina/log;

configurable string? devantProxyHost = ();
configurable int? devantProxyPort = ();
http:ProxyConfig? devantProxyConfig = devantProxyHost is string && devantProxyPort is int ? {host: <string>devantProxyHost, port: <int>devantProxyPort} : ();

configurable string ServiceURL4 = os:getEnv("CHOREO_GET_USERS_SERVICEURL");
configurable string ChoreoAPIKey4 = os:getEnv("CHOREO_GET_USERS_APIKEY");
configurable string ChoreoAPIKey5 = os:getEnv("CHOREO_GET_USERS_CHOREOAPIKEY");



// Log configuration values for debugging
function init() {
    log:printInfo("=== Configuration Check ===");
    log:printInfo("CHOREO_GET_USERS_APIKEY" + (ChoreoAPIKey4.length() > 0 ? "Yes (length: " + ChoreoAPIKey4.length().toString() + ")" : "No/Empty"));
    log:printInfo("CHOREO_GET_USERS_CHOREOAPIKEY" + (ChoreoAPIKey5.length() > 0 ? "Yes (length: " + ChoreoAPIKey5.length().toString() + ")" : "No/Empty"));
}
