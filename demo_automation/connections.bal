import demo_automation.enrichusers;
import demo_automation.getusers;

import ballerina/email;

final getusers:Client get_users = check new (apiKeyConfig = {choreoAPIKey: choreoapikey}, config = {proxy: devantProxyConfig, timeout: 60}, serviceUrl = serviceurl);
final enrichusers:Client enrichusersConnection = check new (serviceUrl = string `${enrichUserSvcUrl}`);
final email:SmtpClient emailConnection = check new (string `${smtpHost}`, string `${smtpUserName}`, string `${smtpPassword}`, port = check int:fromString(smtpPort), security = "SSL");
