# Updated for Realm support by Ryan Baldwin on 2017-08-09
# Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

# These are settings for the FHIR class generator
from env import *
from mappings import *

# Base URL for where to load specification data from
specification_url = 'http://hl7.org/fhir/dstu2/'
#specification_url = 'http://hl7.org/fhir/2016May/'
#specification_url = 'http://hl7-fhir.github.io'

# Whether and where to put the generated class models
tpl_source = "."
write_resources = True
tpl_resource_target_ptrn = '../../../firekit/firekit/classes/models/{}.swift'             # where to write the generated class files to, with one "{}" placeholder for the class name

# Whether and where to put the factory methods
write_factory = write_resources        # required in Swift
tpl_factory_target = '../../../firekit/firekit/classes/models/FHIRAbstractBase+Factory.swift'

# Whether and where to write unit tests
write_unittests = True
tpl_unittest_target_ptrn = '../../../firekit/firekitTests/classes/{}Tests.swift'  # a pattern to determine the output files for unit tests; the one placeholder will be the class name


##
##  Know what you do when changing the following settings
##


# classes/resources
default_base = {
    'complex-type': 'FHIRAbstractBase',                 # for "Element"
    'resource': 'FHIRAbstractResource',                 # for "Resource"
}
resource_modules_lowercase = False                      # whether all resource paths (i.e. modules) should be lowercase
tpl_resource_source = 'template-resource.swift'   # the template to use as source when writing resource implementations for profiles
manual_profiles = [                                     # all these profiles should be copied to dirname(`tpl_resource_target_ptrn`): tuples of (path, module, profile-name-list)
    (tpl_source + '/FHIRAbstractBase.swift', None, ['FHIRAbstractBase']),
    (tpl_source + '/FHIRAbstractResource.swift', None, ['FHIRAbstractResource']),
    (tpl_source + '/FHIRTypes.swift', None, [
    	'boolean',
    	'string', 'base64Binary', 'code', 'id',
    	'decimal', 'integer', 'positiveInt', 'unsignedInt',
    	'uri', 'oid', 'uuid',
    ]),
    (tpl_source + '/DateAndTime.swift', None, [
        'date', 'dateTime', 'time', 'instant',
    ]),
    (tpl_source + '/CascadeDeletable.swift', None, []),
    (tpl_source + '/JSON-extensions.swift', None, []),
    (tpl_source + '/FHIRServer.swift', None, []),
    (tpl_source + '/FHIRServerResponse.swift', None, []),
    (tpl_source + '/FHIRError.swift', None, []),
    (tpl_source + '/RealmTypes.swift', None, []),
    (tpl_source + '/Copying.swift', None, []),
]

# factory methods
tpl_factory_source = tpl_source + '/template-elementfactory.swift'

# search parameters
write_searchparams = False
search_generate_camelcase = True
tpl_searchparams_source = ''
tpl_searchparams_target = ''

# unit tests
tpl_unittest_source = tpl_source + '/template-unittest.swift'
unittest_copyfiles = [
    tpl_source + '/XCTestCase+FHIR.swift',
    tpl_source + '/DateAndTimeTests.swift',
    tpl_source + '/RealmTestingProtocols.swift',
    tpl_source + '/CascadeDeletableTests.swift'
]
unittest_format_path_prepare = '{}?'            # used to format `path` before appending another path element - one placeholder for `path`
unittest_format_path_key = '{}.{}'              # used to create property paths by appending `key` to the existing `path` - two placeholders
unittest_format_path_index = '{}[{}]'          # used for array properties - two placeholders, `path` and the array index
