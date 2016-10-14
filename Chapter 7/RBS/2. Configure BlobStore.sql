use WSS_Content

if not exists (select * from sys.symmetric_keys where name = N'##MS_DatabaseMasterKey##')create master key encryption by password = N'Admin Key Password !2#4'

if not exists (select groupname from sysfilegroups where groupname=N'RBSFilestreamProvider')alter database WSS_Content
 add filegroup RBSFilestreamProvider contains filestream
 
 alter database [WSS_Content] add file (name = RBSFilestreamFile, filename = 'c:\Blobstore') to filegroup RBSFilestreamProvider