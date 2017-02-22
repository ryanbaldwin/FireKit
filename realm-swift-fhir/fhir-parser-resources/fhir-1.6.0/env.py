from os.path import join, dirname
from jinja2 import Environment, FileSystemLoader

current_dir = dirname(__file__)
template_dir = join(current_dir, '../../../fhir-parser-resources/fhir-1.6.0')
jinja2env = Environment(loader=FileSystemLoader(template_dir))