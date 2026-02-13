import demo_integration_3.getusers;
import demo_integration_3.userenrichersvc;

import ballerina/email;

final getusers:Client get_users = check new (apiKeyConfig = {choreoAPIKey: ChoreoAPIKey}, config = {proxy: devantProxyConfig, timeout: 60}, serviceUrl = ServiceURL);
final userenrichersvc:Client userEnricherSvc = check new (serviceUrl = string `${ServiceURL1}`);
final email:SmtpClient emailConnection = check new (string `${smtpHost}`, string `${smtpUsername}`, string `${smtpPassword}`, port = 465, security = "SSL");
