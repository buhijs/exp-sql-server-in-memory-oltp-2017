/****************************************************************************/
/*                       Expert SQL Server In-Memory OLTP                   */
/*      APress. 2nd Edition. ISBN-13:978-1484227718  ISBN-10:1484227719     */
/*                                                                          */
/*                  Written by Dmitri V. Korotkevitch                       */
/*                      http://aboutsqlserver.com                           */
/*                        dk@aboutsqlserver.com                             */
/****************************************************************************/
/*               Chapter 09: In-Memory OLTP Programmability                 */
/*                       01.Natively Compiled Objects                       */
/****************************************************************************/

set nocount on
go

use InMemoryOLTP2016
go

select 
	s.name + '.' + o.name as [Object Name]
	,o.object_id
from
	(
		select schema_id, name, object_id
		from sys.tables
		where is_memory_optimized = 1
        
		union all
        
		select schema_id, name, object_id
		from sys.procedures
	) o join sys.schemas s on
		o.schema_id = s.schema_id;

select base_address, file_version, language, description, name  
from sys.dm_os_loaded_modules 
where description = 'XTP Native DLL';
