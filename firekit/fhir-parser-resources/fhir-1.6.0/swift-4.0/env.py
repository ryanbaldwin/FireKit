# Updated for Realm support by Ryan Baldwin on 2017-08-09
# Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import jinja2
import fhirclass
from mappings import *
from pprint import pprint
import re

# A map of Swift types that require a custom Realm* type for Lists.
realm_listable_types = {
	'Bool': 'RealmBool',
	'Int': 'RealmInt',
	'String': 'RealmString',
	'NSNumber': 'RealmDecimal'
}

def requires_realm_listable_type(prop):
	return realm_listable_types.get(prop.class_name) is not None
jinja2.filters.FILTERS['is_realmlist_custom'] = requires_realm_listable_type


def realm_listify(prop):
	""" Returns the appropriate class type for a Realm List """
	if prop.class_name == 'Resource':
		return 'ContainedResource'

	return realm_listable_types.get(prop.class_name, prop.class_name)

jinja2.filters.FILTERS['realm_listify'] = realm_listify

# A map of Swift types which need to be wrapped in a RealmOptional.
realm_optionals = {'Bool', 'Int', 'NSNumber'}
def requires_realm_optional(prop):
	""" Returns true if this property needs to be wrapped in a realm optional;
		otherwise false."""
	return prop.class_name in realm_optionals

jinja2.filters.FILTERS['requires_realm_optional'] = requires_realm_optional

# FOR `upsert` convenience functions
non_upsertable_types= { 'String', 'Date', 'Data', 'FHIRDate', 'FHIRTime', 'DateTime', 'Instant' }
def can_upsert(prop):
	""" Returns true if this property can have an upsert function; 
		otherwise false."""
	return (not prop.is_native 
		and not requires_realm_optional(prop) 
		and prop.class_name not in non_upsertable_types
		)

jinja2.filters.FILTERS['can_upsert'] = can_upsert

non_populatable_types = { 'String', 'Date', 'Data' }
def populatable(prop):
	""" Returns true if thsi property can be populated; otherwise false."""
	return ((not prop.is_native
			and not requires_realm_optional(prop)
			and prop.class_name not in non_populatable_types) 
			or prop.class_name in { 'FHIRDate', 'FHIRTime', 'DateTime', 'Instant' }
		)

jinja2.filters.FILTERS['populatable'] = populatable

### Filters for Unit Tests
reverse_reservedmap = {v: k for k, v in reservedmap.iteritems()}
propname_regex = re.compile('\w+')

def _expand_test_path(parts, klass):	
	propmatches = propname_regex.match(parts[0])
	propname = propmatches.group() if propmatches else None
	
	if not propname:
		return ""
	
	prop = klass.property_for(reverse_reservedmap.get(propname, propname))	
	
	if len(parts) > 1:		
		return _expand_test_path(parts[1:], fhirclass.FHIRClass.with_name(prop.class_name))
	
	if prop:		
		if prop.is_array and requires_realm_listable_type(prop):
			return ".value"
		elif requires_realm_optional(prop):
			return ".value"

	return ""

def expand_test_path(path, klass):
	# first get the property name for this FHIRUnitTestCase
	return path + _expand_test_path(path.split('.'), klass)	

jinja2.filters.FILTERS['expand_test_path'] = expand_test_path
