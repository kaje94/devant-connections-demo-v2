import ballerina/http;
import ballerina/log;
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

// Log configuration values for debugging
function init() {
    log:printInfo("=== Configuration Check ===");
    log:printInfo("Choreo API Key configured: " + (choreoapikey.length() > 0 ? "Yes (length: " + choreoapikey.length().toString() + ")" : "No/Empty"));
    log:printInfo("Service URL: " + (serviceurl.length() > 0 ? serviceurl : "Not configured"));
    
    // Detailed proxy configuration logging
    log:printInfo("--- Proxy Configuration ---");
    if (devantProxyHost is string) {
        log:printInfo("Devant Proxy Host: PRESENT - " + devantProxyHost.toString());
    } else {
        log:printInfo("Devant Proxy Host: NOT PRESENT");
    }
    
    if (devantProxyPort is int) {
        log:printInfo("Devant Proxy Port: PRESENT - " + devantProxyPort.toString());
    } else {
        log:printInfo("Devant Proxy Port: NOT PRESENT");
    }
    
    if (devantProxyConfig is http:ProxyConfig) {
        http:ProxyConfig proxyConfig = <http:ProxyConfig>devantProxyConfig;
        log:printInfo("Devant Proxy Config: CONFIGURED - {host: \"" + proxyConfig.host + "\", port: " + proxyConfig.port.toString() + "}");
    } else {
        log:printInfo("Devant Proxy Config: NOT CONFIGURED (both host and port must be set)");
    }
    log:printInfo("---------------------------");
    
    log:printInfo("Enrich User Service URL: " + (enrichUserSvcUrl.length() > 0 ? enrichUserSvcUrl : "Not configured"));
    log:printInfo("SMTP Host: " + (smtpHost.length() > 0 ? smtpHost : "Not configured"));
    log:printInfo("SMTP Username: " + (smtpUserName.length() > 0 ? smtpUserName : "Not configured"));
    log:printInfo("SMTP Password configured: " + (smtpPassword.length() > 0 ? "Yes (length: " + smtpPassword.length().toString() + ")" : "No/Empty"));
    log:printInfo("SMTP Port: " + (smtpPort.length() > 0 ? smtpPort : "Not configured"));
    log:printInfo("===========================");
}
