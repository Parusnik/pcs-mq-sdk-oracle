begin
  dbms_network_acl_admin.create_acl
  (
    acl         => 'hcsmqwebproxyservice.xml',
    description => 'HTTP Access to HCS MQ Web Proxy Service',
    principal   => 'PARUS',
    is_grant    => true,
    privilege   => 'connect',
    start_date  => null,
    end_date    => null
  );
end;
/

commit;
/

begin
  dbms_network_acl_admin.add_privilege
  (
    acl       => 'hcsmqwebproxyservice.xml',
    principal => 'PARUS',
    is_grant  => true,
    privilege => 'connect'
  );
end;
/

commit;
/
begin
  dbms_network_acl_admin.assign_acl
  (
    acl        => 'hcsmqwebproxyservice.xml',
    host       => 'localhost',
    lower_port => 7100,
    upper_port => 7100
  );
end;
/

commit;
/