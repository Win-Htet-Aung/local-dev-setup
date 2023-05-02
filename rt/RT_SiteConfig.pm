use utf8;

Set($WebPort, RT_WEB_PORT);
Set($DatabaseType, "mysql");
Set($DatabaseHost, "RT_DB_HOST");
Set($DatabasePort, RT_DB_PORT);
Set($DatabaseUser, "RT_DB_USER");
Set($DatabasePassword, q{RT_DB_PASSWORD});
Set($DatabaseName, q{RT_DB_NAME});
Set($MailCommand, "testfile");
Set($WebDomain, "RT_WEB_DOMAIN");
Set(@ReferrerWhitelist, qw(rt.test:443));

1;
