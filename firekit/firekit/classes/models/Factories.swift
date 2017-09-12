//
//  FHIRAbstractBase+Factory.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
/**
 *  Extension to FHIRAbstractBase to be able to instantiate by class name.
 */
 /*
extension FHIRAbstractBase {
	
	public class func factory(_ className: String, json: FHIRJSON, owner: FHIRAbstractBase?) -> FHIRAbstractBase {
		switch className {
			case "Account":
				return Account(json: json, owner: owner)
			case "Address":
				return Address(json: json, owner: owner)
			case "Age":
				return Age(json: json, owner: owner)
			case "AllergyIntolerance":
				return AllergyIntolerance(json: json, owner: owner)
			case "AllergyIntoleranceReaction":
				return AllergyIntoleranceReaction(json: json, owner: owner)
			case "Annotation":
				return Annotation(json: json, owner: owner)
			case "Appointment":
				return Appointment(json: json, owner: owner)
			case "AppointmentParticipant":
				return AppointmentParticipant(json: json, owner: owner)
			case "AppointmentResponse":
				return AppointmentResponse(json: json, owner: owner)
			case "Attachment":
				return Attachment(json: json, owner: owner)
			case "AuditEvent":
				return AuditEvent(json: json, owner: owner)
			case "AuditEventEvent":
				return AuditEventEvent(json: json, owner: owner)
			case "AuditEventObject":
				return AuditEventObject(json: json, owner: owner)
			case "AuditEventObjectDetail":
				return AuditEventObjectDetail(json: json, owner: owner)
			case "AuditEventParticipant":
				return AuditEventParticipant(json: json, owner: owner)
			case "AuditEventParticipantNetwork":
				return AuditEventParticipantNetwork(json: json, owner: owner)
			case "AuditEventSource":
				return AuditEventSource(json: json, owner: owner)
			case "BackboneElement":
				return BackboneElement(json: json, owner: owner)
			case "Basic":
				return Basic(json: json, owner: owner)
			case "Binary":
				return Binary(json: json, owner: owner)
			case "BodySite":
				return BodySite(json: json, owner: owner)
			case "Bundle":
				return Bundle(json: json, owner: owner)
			case "BundleEntry":
				return BundleEntry(json: json, owner: owner)
			case "BundleEntryRequest":
				return BundleEntryRequest(json: json, owner: owner)
			case "BundleEntryResponse":
				return BundleEntryResponse(json: json, owner: owner)
			case "BundleEntrySearch":
				return BundleEntrySearch(json: json, owner: owner)
			case "BundleLink":
				return BundleLink(json: json, owner: owner)
			case "CarePlan":
				return CarePlan(json: json, owner: owner)
			case "CarePlanActivity":
				return CarePlanActivity(json: json, owner: owner)
			case "CarePlanActivityDetail":
				return CarePlanActivityDetail(json: json, owner: owner)
			case "CarePlanParticipant":
				return CarePlanParticipant(json: json, owner: owner)
			case "CarePlanRelatedPlan":
				return CarePlanRelatedPlan(json: json, owner: owner)
			case "Claim":
				return Claim(json: json, owner: owner)
			case "ClaimCoverage":
				return ClaimCoverage(json: json, owner: owner)
			case "ClaimDiagnosis":
				return ClaimDiagnosis(json: json, owner: owner)
			case "ClaimItem":
				return ClaimItem(json: json, owner: owner)
			case "ClaimItemDetail":
				return ClaimItemDetail(json: json, owner: owner)
			case "ClaimItemDetailSubDetail":
				return ClaimItemDetailSubDetail(json: json, owner: owner)
			case "ClaimItemProsthesis":
				return ClaimItemProsthesis(json: json, owner: owner)
			case "ClaimMissingTeeth":
				return ClaimMissingTeeth(json: json, owner: owner)
			case "ClaimPayee":
				return ClaimPayee(json: json, owner: owner)
			case "ClaimResponse":
				return ClaimResponse(json: json, owner: owner)
			case "ClaimResponseAddItem":
				return ClaimResponseAddItem(json: json, owner: owner)
			case "ClaimResponseAddItemAdjudication":
				return ClaimResponseAddItemAdjudication(json: json, owner: owner)
			case "ClaimResponseAddItemDetail":
				return ClaimResponseAddItemDetail(json: json, owner: owner)
			case "ClaimResponseAddItemDetailAdjudication":
				return ClaimResponseAddItemDetailAdjudication(json: json, owner: owner)
			case "ClaimResponseCoverage":
				return ClaimResponseCoverage(json: json, owner: owner)
			case "ClaimResponseError":
				return ClaimResponseError(json: json, owner: owner)
			case "ClaimResponseItem":
				return ClaimResponseItem(json: json, owner: owner)
			case "ClaimResponseItemAdjudication":
				return ClaimResponseItemAdjudication(json: json, owner: owner)
			case "ClaimResponseItemDetail":
				return ClaimResponseItemDetail(json: json, owner: owner)
			case "ClaimResponseItemDetailAdjudication":
				return ClaimResponseItemDetailAdjudication(json: json, owner: owner)
			case "ClaimResponseItemDetailSubDetail":
				return ClaimResponseItemDetailSubDetail(json: json, owner: owner)
			case "ClaimResponseItemDetailSubDetailAdjudication":
				return ClaimResponseItemDetailSubDetailAdjudication(json: json, owner: owner)
			case "ClaimResponseNote":
				return ClaimResponseNote(json: json, owner: owner)
			case "ClinicalImpression":
				return ClinicalImpression(json: json, owner: owner)
			case "ClinicalImpressionFinding":
				return ClinicalImpressionFinding(json: json, owner: owner)
			case "ClinicalImpressionInvestigations":
				return ClinicalImpressionInvestigations(json: json, owner: owner)
			case "ClinicalImpressionRuledOut":
				return ClinicalImpressionRuledOut(json: json, owner: owner)
			case "CodeableConcept":
				return CodeableConcept(json: json, owner: owner)
			case "Coding":
				return Coding(json: json, owner: owner)
			case "Communication":
				return Communication(json: json, owner: owner)
			case "CommunicationPayload":
				return CommunicationPayload(json: json, owner: owner)
			case "CommunicationRequest":
				return CommunicationRequest(json: json, owner: owner)
			case "CommunicationRequestPayload":
				return CommunicationRequestPayload(json: json, owner: owner)
			case "Composition":
				return Composition(json: json, owner: owner)
			case "CompositionAttester":
				return CompositionAttester(json: json, owner: owner)
			case "CompositionEvent":
				return CompositionEvent(json: json, owner: owner)
			case "CompositionSection":
				return CompositionSection(json: json, owner: owner)
			case "ConceptMap":
				return ConceptMap(json: json, owner: owner)
			case "ConceptMapContact":
				return ConceptMapContact(json: json, owner: owner)
			case "ConceptMapElement":
				return ConceptMapElement(json: json, owner: owner)
			case "ConceptMapElementTarget":
				return ConceptMapElementTarget(json: json, owner: owner)
			case "ConceptMapElementTargetDependsOn":
				return ConceptMapElementTargetDependsOn(json: json, owner: owner)
			case "Condition":
				return Condition(json: json, owner: owner)
			case "ConditionEvidence":
				return ConditionEvidence(json: json, owner: owner)
			case "ConditionStage":
				return ConditionStage(json: json, owner: owner)
			case "Conformance":
				return Conformance(json: json, owner: owner)
			case "ConformanceContact":
				return ConformanceContact(json: json, owner: owner)
			case "ConformanceDocument":
				return ConformanceDocument(json: json, owner: owner)
			case "ConformanceImplementation":
				return ConformanceImplementation(json: json, owner: owner)
			case "ConformanceMessaging":
				return ConformanceMessaging(json: json, owner: owner)
			case "ConformanceMessagingEndpoint":
				return ConformanceMessagingEndpoint(json: json, owner: owner)
			case "ConformanceMessagingEvent":
				return ConformanceMessagingEvent(json: json, owner: owner)
			case "ConformanceRest":
				return ConformanceRest(json: json, owner: owner)
			case "ConformanceRestInteraction":
				return ConformanceRestInteraction(json: json, owner: owner)
			case "ConformanceRestOperation":
				return ConformanceRestOperation(json: json, owner: owner)
			case "ConformanceRestResource":
				return ConformanceRestResource(json: json, owner: owner)
			case "ConformanceRestResourceInteraction":
				return ConformanceRestResourceInteraction(json: json, owner: owner)
			case "ConformanceRestResourceSearchParam":
				return ConformanceRestResourceSearchParam(json: json, owner: owner)
			case "ConformanceRestSecurity":
				return ConformanceRestSecurity(json: json, owner: owner)
			case "ConformanceRestSecurityCertificate":
				return ConformanceRestSecurityCertificate(json: json, owner: owner)
			case "ConformanceSoftware":
				return ConformanceSoftware(json: json, owner: owner)
			case "ContactPoint":
				return ContactPoint(json: json, owner: owner)
			case "Contract":
				return Contract(json: json, owner: owner)
			case "ContractActor":
				return ContractActor(json: json, owner: owner)
			case "ContractFriendly":
				return ContractFriendly(json: json, owner: owner)
			case "ContractLegal":
				return ContractLegal(json: json, owner: owner)
			case "ContractRule":
				return ContractRule(json: json, owner: owner)
			case "ContractSigner":
				return ContractSigner(json: json, owner: owner)
			case "ContractTerm":
				return ContractTerm(json: json, owner: owner)
			case "ContractTermActor":
				return ContractTermActor(json: json, owner: owner)
			case "ContractTermValuedItem":
				return ContractTermValuedItem(json: json, owner: owner)
			case "ContractValuedItem":
				return ContractValuedItem(json: json, owner: owner)
			case "Count":
				return Count(json: json, owner: owner)
			case "Coverage":
				return Coverage(json: json, owner: owner)
			case "DataElement":
				return DataElement(json: json, owner: owner)
			case "DataElementContact":
				return DataElementContact(json: json, owner: owner)
			case "DataElementMapping":
				return DataElementMapping(json: json, owner: owner)
			case "DetectedIssue":
				return DetectedIssue(json: json, owner: owner)
			case "DetectedIssueMitigation":
				return DetectedIssueMitigation(json: json, owner: owner)
			case "Device":
				return Device(json: json, owner: owner)
			case "DeviceComponent":
				return DeviceComponent(json: json, owner: owner)
			case "DeviceComponentProductionSpecification":
				return DeviceComponentProductionSpecification(json: json, owner: owner)
			case "DeviceMetric":
				return DeviceMetric(json: json, owner: owner)
			case "DeviceMetricCalibration":
				return DeviceMetricCalibration(json: json, owner: owner)
			case "DeviceUseRequest":
				return DeviceUseRequest(json: json, owner: owner)
			case "DeviceUseStatement":
				return DeviceUseStatement(json: json, owner: owner)
			case "DiagnosticOrder":
				return DiagnosticOrder(json: json, owner: owner)
			case "DiagnosticOrderEvent":
				return DiagnosticOrderEvent(json: json, owner: owner)
			case "DiagnosticOrderItem":
				return DiagnosticOrderItem(json: json, owner: owner)
			case "DiagnosticReport":
				return DiagnosticReport(json: json, owner: owner)
			case "DiagnosticReportImage":
				return DiagnosticReportImage(json: json, owner: owner)
			case "Distance":
				return Distance(json: json, owner: owner)
			case "DocumentManifest":
				return DocumentManifest(json: json, owner: owner)
			case "DocumentManifestContent":
				return DocumentManifestContent(json: json, owner: owner)
			case "DocumentManifestRelated":
				return DocumentManifestRelated(json: json, owner: owner)
			case "DocumentReference":
				return DocumentReference(json: json, owner: owner)
			case "DocumentReferenceContent":
				return DocumentReferenceContent(json: json, owner: owner)
			case "DocumentReferenceContext":
				return DocumentReferenceContext(json: json, owner: owner)
			case "DocumentReferenceContextRelated":
				return DocumentReferenceContextRelated(json: json, owner: owner)
			case "DocumentReferenceRelatesTo":
				return DocumentReferenceRelatesTo(json: json, owner: owner)
			case "DomainResource":
				return DomainResource(json: json, owner: owner)
			case "Duration":
				return Duration(json: json, owner: owner)
			case "Element":
				return Element(json: json, owner: owner)
			case "ElementDefinition":
				return ElementDefinition(json: json, owner: owner)
			case "ElementDefinitionBase":
				return ElementDefinitionBase(json: json, owner: owner)
			case "ElementDefinitionBinding":
				return ElementDefinitionBinding(json: json, owner: owner)
			case "ElementDefinitionConstraint":
				return ElementDefinitionConstraint(json: json, owner: owner)
			case "ElementDefinitionMapping":
				return ElementDefinitionMapping(json: json, owner: owner)
			case "ElementDefinitionSlicing":
				return ElementDefinitionSlicing(json: json, owner: owner)
			case "ElementDefinitionType":
				return ElementDefinitionType(json: json, owner: owner)
			case "EligibilityRequest":
				return EligibilityRequest(json: json, owner: owner)
			case "EligibilityResponse":
				return EligibilityResponse(json: json, owner: owner)
			case "Encounter":
				return Encounter(json: json, owner: owner)
			case "EncounterHospitalization":
				return EncounterHospitalization(json: json, owner: owner)
			case "EncounterLocation":
				return EncounterLocation(json: json, owner: owner)
			case "EncounterParticipant":
				return EncounterParticipant(json: json, owner: owner)
			case "EncounterStatusHistory":
				return EncounterStatusHistory(json: json, owner: owner)
			case "EnrollmentRequest":
				return EnrollmentRequest(json: json, owner: owner)
			case "EnrollmentResponse":
				return EnrollmentResponse(json: json, owner: owner)
			case "EpisodeOfCare":
				return EpisodeOfCare(json: json, owner: owner)
			case "EpisodeOfCareCareTeam":
				return EpisodeOfCareCareTeam(json: json, owner: owner)
			case "EpisodeOfCareStatusHistory":
				return EpisodeOfCareStatusHistory(json: json, owner: owner)
			case "ExplanationOfBenefit":
				return ExplanationOfBenefit(json: json, owner: owner)
			case "Extension":
				return Extension(json: json, owner: owner)
			case "FamilyMemberHistory":
				return FamilyMemberHistory(json: json, owner: owner)
			case "FamilyMemberHistoryCondition":
				return FamilyMemberHistoryCondition(json: json, owner: owner)
			case "Flag":
				return Flag(json: json, owner: owner)
			case "Goal":
				return Goal(json: json, owner: owner)
			case "GoalOutcome":
				return GoalOutcome(json: json, owner: owner)
			case "Group":
				return Group(json: json, owner: owner)
			case "GroupCharacteristic":
				return GroupCharacteristic(json: json, owner: owner)
			case "GroupMember":
				return GroupMember(json: json, owner: owner)
			case "HealthcareService":
				return HealthcareService(json: json, owner: owner)
			case "HealthcareServiceAvailableTime":
				return HealthcareServiceAvailableTime(json: json, owner: owner)
			case "HealthcareServiceNotAvailable":
				return HealthcareServiceNotAvailable(json: json, owner: owner)
			case "HealthcareServiceServiceType":
				return HealthcareServiceServiceType(json: json, owner: owner)
			case "HumanName":
				return HumanName(json: json, owner: owner)
			case "Identifier":
				return Identifier(json: json, owner: owner)
			case "ImagingObjectSelection":
				return ImagingObjectSelection(json: json, owner: owner)
			case "ImagingObjectSelectionStudy":
				return ImagingObjectSelectionStudy(json: json, owner: owner)
			case "ImagingObjectSelectionStudySeries":
				return ImagingObjectSelectionStudySeries(json: json, owner: owner)
			case "ImagingObjectSelectionStudySeriesInstance":
				return ImagingObjectSelectionStudySeriesInstance(json: json, owner: owner)
			case "ImagingObjectSelectionStudySeriesInstanceFrames":
				return ImagingObjectSelectionStudySeriesInstanceFrames(json: json, owner: owner)
			case "ImagingStudy":
				return ImagingStudy(json: json, owner: owner)
			case "ImagingStudySeries":
				return ImagingStudySeries(json: json, owner: owner)
			case "ImagingStudySeriesInstance":
				return ImagingStudySeriesInstance(json: json, owner: owner)
			case "Immunization":
				return Immunization(json: json, owner: owner)
			case "ImmunizationExplanation":
				return ImmunizationExplanation(json: json, owner: owner)
			case "ImmunizationReaction":
				return ImmunizationReaction(json: json, owner: owner)
			case "ImmunizationRecommendation":
				return ImmunizationRecommendation(json: json, owner: owner)
			case "ImmunizationRecommendationRecommendation":
				return ImmunizationRecommendationRecommendation(json: json, owner: owner)
			case "ImmunizationRecommendationRecommendationDateCriterion":
				return ImmunizationRecommendationRecommendationDateCriterion(json: json, owner: owner)
			case "ImmunizationRecommendationRecommendationProtocol":
				return ImmunizationRecommendationRecommendationProtocol(json: json, owner: owner)
			case "ImmunizationVaccinationProtocol":
				return ImmunizationVaccinationProtocol(json: json, owner: owner)
			case "ImplementationGuide":
				return ImplementationGuide(json: json, owner: owner)
			case "ImplementationGuideContact":
				return ImplementationGuideContact(json: json, owner: owner)
			case "ImplementationGuideDependency":
				return ImplementationGuideDependency(json: json, owner: owner)
			case "ImplementationGuideGlobal":
				return ImplementationGuideGlobal(json: json, owner: owner)
			case "ImplementationGuidePackage":
				return ImplementationGuidePackage(json: json, owner: owner)
			case "ImplementationGuidePackageResource":
				return ImplementationGuidePackageResource(json: json, owner: owner)
			case "ImplementationGuidePage":
				return ImplementationGuidePage(json: json, owner: owner)
			case "List":
				return List(json: json, owner: owner)
			case "ListEntry":
				return ListEntry(json: json, owner: owner)
			case "Location":
				return Location(json: json, owner: owner)
			case "LocationPosition":
				return LocationPosition(json: json, owner: owner)
			case "Media":
				return Media(json: json, owner: owner)
			case "Medication":
				return Medication(json: json, owner: owner)
			case "MedicationAdministration":
				return MedicationAdministration(json: json, owner: owner)
			case "MedicationAdministrationDosage":
				return MedicationAdministrationDosage(json: json, owner: owner)
			case "MedicationDispense":
				return MedicationDispense(json: json, owner: owner)
			case "MedicationDispenseDosageInstruction":
				return MedicationDispenseDosageInstruction(json: json, owner: owner)
			case "MedicationDispenseSubstitution":
				return MedicationDispenseSubstitution(json: json, owner: owner)
			case "MedicationOrder":
				return MedicationOrder(json: json, owner: owner)
			case "MedicationOrderDispenseRequest":
				return MedicationOrderDispenseRequest(json: json, owner: owner)
			case "MedicationOrderDosageInstruction":
				return MedicationOrderDosageInstruction(json: json, owner: owner)
			case "MedicationOrderSubstitution":
				return MedicationOrderSubstitution(json: json, owner: owner)
			case "MedicationPackage":
				return MedicationPackage(json: json, owner: owner)
			case "MedicationPackageContent":
				return MedicationPackageContent(json: json, owner: owner)
			case "MedicationProduct":
				return MedicationProduct(json: json, owner: owner)
			case "MedicationProductBatch":
				return MedicationProductBatch(json: json, owner: owner)
			case "MedicationProductIngredient":
				return MedicationProductIngredient(json: json, owner: owner)
			case "MedicationStatement":
				return MedicationStatement(json: json, owner: owner)
			case "MedicationStatementDosage":
				return MedicationStatementDosage(json: json, owner: owner)
			case "MessageHeader":
				return MessageHeader(json: json, owner: owner)
			case "MessageHeaderDestination":
				return MessageHeaderDestination(json: json, owner: owner)
			case "MessageHeaderResponse":
				return MessageHeaderResponse(json: json, owner: owner)
			case "MessageHeaderSource":
				return MessageHeaderSource(json: json, owner: owner)
			case "Meta":
				return Meta(json: json, owner: owner)
			case "Money":
				return Money(json: json, owner: owner)
			case "NamingSystem":
				return NamingSystem(json: json, owner: owner)
			case "NamingSystemContact":
				return NamingSystemContact(json: json, owner: owner)
			case "NamingSystemUniqueId":
				return NamingSystemUniqueId(json: json, owner: owner)
			case "Narrative":
				return Narrative(json: json, owner: owner)
			case "NutritionOrder":
				return NutritionOrder(json: json, owner: owner)
			case "NutritionOrderEnteralFormula":
				return NutritionOrderEnteralFormula(json: json, owner: owner)
			case "NutritionOrderEnteralFormulaAdministration":
				return NutritionOrderEnteralFormulaAdministration(json: json, owner: owner)
			case "NutritionOrderOralDiet":
				return NutritionOrderOralDiet(json: json, owner: owner)
			case "NutritionOrderOralDietNutrient":
				return NutritionOrderOralDietNutrient(json: json, owner: owner)
			case "NutritionOrderOralDietTexture":
				return NutritionOrderOralDietTexture(json: json, owner: owner)
			case "NutritionOrderSupplement":
				return NutritionOrderSupplement(json: json, owner: owner)
			case "Observation":
				return Observation(json: json, owner: owner)
			case "ObservationComponent":
				return ObservationComponent(json: json, owner: owner)
			case "ObservationReferenceRange":
				return ObservationReferenceRange(json: json, owner: owner)
			case "ObservationRelated":
				return ObservationRelated(json: json, owner: owner)
			case "OperationDefinition":
				return OperationDefinition(json: json, owner: owner)
			case "OperationDefinitionContact":
				return OperationDefinitionContact(json: json, owner: owner)
			case "OperationDefinitionParameter":
				return OperationDefinitionParameter(json: json, owner: owner)
			case "OperationDefinitionParameterBinding":
				return OperationDefinitionParameterBinding(json: json, owner: owner)
			case "OperationOutcome":
				return OperationOutcome(json: json, owner: owner)
			case "OperationOutcomeIssue":
				return OperationOutcomeIssue(json: json, owner: owner)
			case "Order":
				return Order(json: json, owner: owner)
			case "OrderResponse":
				return OrderResponse(json: json, owner: owner)
			case "OrderWhen":
				return OrderWhen(json: json, owner: owner)
			case "Organization":
				return Organization(json: json, owner: owner)
			case "OrganizationContact":
				return OrganizationContact(json: json, owner: owner)
			case "Parameters":
				return Parameters(json: json, owner: owner)
			case "ParametersParameter":
				return ParametersParameter(json: json, owner: owner)
			case "Patient":
				return Patient(json: json, owner: owner)
			case "PatientAnimal":
				return PatientAnimal(json: json, owner: owner)
			case "PatientCommunication":
				return PatientCommunication(json: json, owner: owner)
			case "PatientContact":
				return PatientContact(json: json, owner: owner)
			case "PatientLink":
				return PatientLink(json: json, owner: owner)
			case "PaymentNotice":
				return PaymentNotice(json: json, owner: owner)
			case "PaymentReconciliation":
				return PaymentReconciliation(json: json, owner: owner)
			case "PaymentReconciliationDetail":
				return PaymentReconciliationDetail(json: json, owner: owner)
			case "PaymentReconciliationNote":
				return PaymentReconciliationNote(json: json, owner: owner)
			case "Period":
				return Period(json: json, owner: owner)
			case "Person":
				return Person(json: json, owner: owner)
			case "PersonLink":
				return PersonLink(json: json, owner: owner)
			case "Practitioner":
				return Practitioner(json: json, owner: owner)
			case "PractitionerPractitionerRole":
				return PractitionerPractitionerRole(json: json, owner: owner)
			case "PractitionerQualification":
				return PractitionerQualification(json: json, owner: owner)
			case "Procedure":
				return Procedure(json: json, owner: owner)
			case "ProcedureFocalDevice":
				return ProcedureFocalDevice(json: json, owner: owner)
			case "ProcedurePerformer":
				return ProcedurePerformer(json: json, owner: owner)
			case "ProcedureRequest":
				return ProcedureRequest(json: json, owner: owner)
			case "ProcessRequest":
				return ProcessRequest(json: json, owner: owner)
			case "ProcessRequestItem":
				return ProcessRequestItem(json: json, owner: owner)
			case "ProcessResponse":
				return ProcessResponse(json: json, owner: owner)
			case "ProcessResponseNotes":
				return ProcessResponseNotes(json: json, owner: owner)
			case "Provenance":
				return Provenance(json: json, owner: owner)
			case "ProvenanceAgent":
				return ProvenanceAgent(json: json, owner: owner)
			case "ProvenanceAgentRelatedAgent":
				return ProvenanceAgentRelatedAgent(json: json, owner: owner)
			case "ProvenanceEntity":
				return ProvenanceEntity(json: json, owner: owner)
			case "Quantity":
				return Quantity(json: json, owner: owner)
			case "Questionnaire":
				return Questionnaire(json: json, owner: owner)
			case "QuestionnaireGroup":
				return QuestionnaireGroup(json: json, owner: owner)
			case "QuestionnaireGroupQuestion":
				return QuestionnaireGroupQuestion(json: json, owner: owner)
			case "QuestionnaireResponse":
				return QuestionnaireResponse(json: json, owner: owner)
			case "QuestionnaireResponseGroup":
				return QuestionnaireResponseGroup(json: json, owner: owner)
			case "QuestionnaireResponseGroupQuestion":
				return QuestionnaireResponseGroupQuestion(json: json, owner: owner)
			case "QuestionnaireResponseGroupQuestionAnswer":
				return QuestionnaireResponseGroupQuestionAnswer(json: json, owner: owner)
			case "Range":
				return Range(json: json, owner: owner)
			case "Ratio":
				return Ratio(json: json, owner: owner)
			case "Reference":
				return Reference(json: json, owner: owner)
			case "ReferralRequest":
				return ReferralRequest(json: json, owner: owner)
			case "RelatedPerson":
				return RelatedPerson(json: json, owner: owner)
			case "Resource":
				return Resource(json: json, owner: owner)
			case "RiskAssessment":
				return RiskAssessment(json: json, owner: owner)
			case "RiskAssessmentPrediction":
				return RiskAssessmentPrediction(json: json, owner: owner)
			case "SampledData":
				return SampledData(json: json, owner: owner)
			case "Schedule":
				return Schedule(json: json, owner: owner)
			case "SearchParameter":
				return SearchParameter(json: json, owner: owner)
			case "SearchParameterContact":
				return SearchParameterContact(json: json, owner: owner)
			case "Signature":
				return Signature(json: json, owner: owner)
			case "Slot":
				return Slot(json: json, owner: owner)
			case "Specimen":
				return Specimen(json: json, owner: owner)
			case "SpecimenCollection":
				return SpecimenCollection(json: json, owner: owner)
			case "SpecimenContainer":
				return SpecimenContainer(json: json, owner: owner)
			case "SpecimenTreatment":
				return SpecimenTreatment(json: json, owner: owner)
			case "StructureDefinition":
				return StructureDefinition(json: json, owner: owner)
			case "StructureDefinitionContact":
				return StructureDefinitionContact(json: json, owner: owner)
			case "StructureDefinitionDifferential":
				return StructureDefinitionDifferential(json: json, owner: owner)
			case "StructureDefinitionMapping":
				return StructureDefinitionMapping(json: json, owner: owner)
			case "StructureDefinitionSnapshot":
				return StructureDefinitionSnapshot(json: json, owner: owner)
			case "Subscription":
				return Subscription(json: json, owner: owner)
			case "SubscriptionChannel":
				return SubscriptionChannel(json: json, owner: owner)
			case "Substance":
				return Substance(json: json, owner: owner)
			case "SubstanceIngredient":
				return SubstanceIngredient(json: json, owner: owner)
			case "SubstanceInstance":
				return SubstanceInstance(json: json, owner: owner)
			case "SupplyDelivery":
				return SupplyDelivery(json: json, owner: owner)
			case "SupplyRequest":
				return SupplyRequest(json: json, owner: owner)
			case "SupplyRequestWhen":
				return SupplyRequestWhen(json: json, owner: owner)
			case "TestScript":
				return TestScript(json: json, owner: owner)
			case "TestScriptContact":
				return TestScriptContact(json: json, owner: owner)
			case "TestScriptFixture":
				return TestScriptFixture(json: json, owner: owner)
			case "TestScriptMetadata":
				return TestScriptMetadata(json: json, owner: owner)
			case "TestScriptMetadataCapability":
				return TestScriptMetadataCapability(json: json, owner: owner)
			case "TestScriptMetadataLink":
				return TestScriptMetadataLink(json: json, owner: owner)
			case "TestScriptSetup":
				return TestScriptSetup(json: json, owner: owner)
			case "TestScriptSetupAction":
				return TestScriptSetupAction(json: json, owner: owner)
			case "TestScriptSetupActionAssert":
				return TestScriptSetupActionAssert(json: json, owner: owner)
			case "TestScriptSetupActionOperation":
				return TestScriptSetupActionOperation(json: json, owner: owner)
			case "TestScriptSetupActionOperationRequestHeader":
				return TestScriptSetupActionOperationRequestHeader(json: json, owner: owner)
			case "TestScriptTeardown":
				return TestScriptTeardown(json: json, owner: owner)
			case "TestScriptTeardownAction":
				return TestScriptTeardownAction(json: json, owner: owner)
			case "TestScriptTest":
				return TestScriptTest(json: json, owner: owner)
			case "TestScriptTestAction":
				return TestScriptTestAction(json: json, owner: owner)
			case "TestScriptVariable":
				return TestScriptVariable(json: json, owner: owner)
			case "Timing":
				return Timing(json: json, owner: owner)
			case "TimingRepeat":
				return TimingRepeat(json: json, owner: owner)
			case "ValueSet":
				return ValueSet(json: json, owner: owner)
			case "ValueSetCodeSystem":
				return ValueSetCodeSystem(json: json, owner: owner)
			case "ValueSetCodeSystemConcept":
				return ValueSetCodeSystemConcept(json: json, owner: owner)
			case "ValueSetCodeSystemConceptDesignation":
				return ValueSetCodeSystemConceptDesignation(json: json, owner: owner)
			case "ValueSetCompose":
				return ValueSetCompose(json: json, owner: owner)
			case "ValueSetComposeInclude":
				return ValueSetComposeInclude(json: json, owner: owner)
			case "ValueSetComposeIncludeConcept":
				return ValueSetComposeIncludeConcept(json: json, owner: owner)
			case "ValueSetComposeIncludeFilter":
				return ValueSetComposeIncludeFilter(json: json, owner: owner)
			case "ValueSetContact":
				return ValueSetContact(json: json, owner: owner)
			case "ValueSetExpansion":
				return ValueSetExpansion(json: json, owner: owner)
			case "ValueSetExpansionContains":
				return ValueSetExpansionContains(json: json, owner: owner)
			case "ValueSetExpansionParameter":
				return ValueSetExpansionParameter(json: json, owner: owner)
			case "VisionPrescription":
				return VisionPrescription(json: json, owner: owner)
			case "VisionPrescriptionDispense":
				return VisionPrescriptionDispense(json: json, owner: owner)
			default:
				return FHIRAbstractBase(json: json, owner: owner)
		}
	}
}
*/
extension FHIRAbstractBase {
  public class func resourceType(from className: String) -> FHIRAbstractBase.Type {
    switch className {
      case "Account":
        return Account.self
      case "Address":
        return Address.self
      case "Age":
        return Age.self
      case "AllergyIntolerance":
        return AllergyIntolerance.self
      case "AllergyIntoleranceReaction":
        return AllergyIntoleranceReaction.self
      case "Annotation":
        return Annotation.self
      case "Appointment":
        return Appointment.self
      case "AppointmentParticipant":
        return AppointmentParticipant.self
      case "AppointmentResponse":
        return AppointmentResponse.self
      case "Attachment":
        return Attachment.self
      case "AuditEvent":
        return AuditEvent.self
      case "AuditEventEvent":
        return AuditEventEvent.self
      case "AuditEventObject":
        return AuditEventObject.self
      case "AuditEventObjectDetail":
        return AuditEventObjectDetail.self
      case "AuditEventParticipant":
        return AuditEventParticipant.self
      case "AuditEventParticipantNetwork":
        return AuditEventParticipantNetwork.self
      case "AuditEventSource":
        return AuditEventSource.self
      case "BackboneElement":
        return BackboneElement.self
      case "Basic":
        return Basic.self
      case "Binary":
        return Binary.self
      case "BodySite":
        return BodySite.self
      case "Bundle":
        return Bundle.self
      case "BundleEntry":
        return BundleEntry.self
      case "BundleEntryRequest":
        return BundleEntryRequest.self
      case "BundleEntryResponse":
        return BundleEntryResponse.self
      case "BundleEntrySearch":
        return BundleEntrySearch.self
      case "BundleLink":
        return BundleLink.self
      case "CarePlan":
        return CarePlan.self
      case "CarePlanActivity":
        return CarePlanActivity.self
      case "CarePlanActivityDetail":
        return CarePlanActivityDetail.self
      case "CarePlanParticipant":
        return CarePlanParticipant.self
      case "CarePlanRelatedPlan":
        return CarePlanRelatedPlan.self
      case "Claim":
        return Claim.self
      case "ClaimCoverage":
        return ClaimCoverage.self
      case "ClaimDiagnosis":
        return ClaimDiagnosis.self
      case "ClaimItem":
        return ClaimItem.self
      case "ClaimItemDetail":
        return ClaimItemDetail.self
      case "ClaimItemDetailSubDetail":
        return ClaimItemDetailSubDetail.self
      case "ClaimItemProsthesis":
        return ClaimItemProsthesis.self
      case "ClaimMissingTeeth":
        return ClaimMissingTeeth.self
      case "ClaimPayee":
        return ClaimPayee.self
      case "ClaimResponse":
        return ClaimResponse.self
      case "ClaimResponseAddItem":
        return ClaimResponseAddItem.self
      case "ClaimResponseAddItemAdjudication":
        return ClaimResponseAddItemAdjudication.self
      case "ClaimResponseAddItemDetail":
        return ClaimResponseAddItemDetail.self
      case "ClaimResponseAddItemDetailAdjudication":
        return ClaimResponseAddItemDetailAdjudication.self
      case "ClaimResponseCoverage":
        return ClaimResponseCoverage.self
      case "ClaimResponseError":
        return ClaimResponseError.self
      case "ClaimResponseItem":
        return ClaimResponseItem.self
      case "ClaimResponseItemAdjudication":
        return ClaimResponseItemAdjudication.self
      case "ClaimResponseItemDetail":
        return ClaimResponseItemDetail.self
      case "ClaimResponseItemDetailAdjudication":
        return ClaimResponseItemDetailAdjudication.self
      case "ClaimResponseItemDetailSubDetail":
        return ClaimResponseItemDetailSubDetail.self
      case "ClaimResponseItemDetailSubDetailAdjudication":
        return ClaimResponseItemDetailSubDetailAdjudication.self
      case "ClaimResponseNote":
        return ClaimResponseNote.self
      case "ClinicalImpression":
        return ClinicalImpression.self
      case "ClinicalImpressionFinding":
        return ClinicalImpressionFinding.self
      case "ClinicalImpressionInvestigations":
        return ClinicalImpressionInvestigations.self
      case "ClinicalImpressionRuledOut":
        return ClinicalImpressionRuledOut.self
      case "CodeableConcept":
        return CodeableConcept.self
      case "Coding":
        return Coding.self
      case "Communication":
        return Communication.self
      case "CommunicationPayload":
        return CommunicationPayload.self
      case "CommunicationRequest":
        return CommunicationRequest.self
      case "CommunicationRequestPayload":
        return CommunicationRequestPayload.self
      case "Composition":
        return Composition.self
      case "CompositionAttester":
        return CompositionAttester.self
      case "CompositionEvent":
        return CompositionEvent.self
      case "CompositionSection":
        return CompositionSection.self
      case "ConceptMap":
        return ConceptMap.self
      case "ConceptMapContact":
        return ConceptMapContact.self
      case "ConceptMapElement":
        return ConceptMapElement.self
      case "ConceptMapElementTarget":
        return ConceptMapElementTarget.self
      case "ConceptMapElementTargetDependsOn":
        return ConceptMapElementTargetDependsOn.self
      case "Condition":
        return Condition.self
      case "ConditionEvidence":
        return ConditionEvidence.self
      case "ConditionStage":
        return ConditionStage.self
      case "Conformance":
        return Conformance.self
      case "ConformanceContact":
        return ConformanceContact.self
      case "ConformanceDocument":
        return ConformanceDocument.self
      case "ConformanceImplementation":
        return ConformanceImplementation.self
      case "ConformanceMessaging":
        return ConformanceMessaging.self
      case "ConformanceMessagingEndpoint":
        return ConformanceMessagingEndpoint.self
      case "ConformanceMessagingEvent":
        return ConformanceMessagingEvent.self
      case "ConformanceRest":
        return ConformanceRest.self
      case "ConformanceRestInteraction":
        return ConformanceRestInteraction.self
      case "ConformanceRestOperation":
        return ConformanceRestOperation.self
      case "ConformanceRestResource":
        return ConformanceRestResource.self
      case "ConformanceRestResourceInteraction":
        return ConformanceRestResourceInteraction.self
      case "ConformanceRestResourceSearchParam":
        return ConformanceRestResourceSearchParam.self
      case "ConformanceRestSecurity":
        return ConformanceRestSecurity.self
      case "ConformanceRestSecurityCertificate":
        return ConformanceRestSecurityCertificate.self
      case "ConformanceSoftware":
        return ConformanceSoftware.self
      case "ContactPoint":
        return ContactPoint.self
      case "Contract":
        return Contract.self
      case "ContractActor":
        return ContractActor.self
      case "ContractFriendly":
        return ContractFriendly.self
      case "ContractLegal":
        return ContractLegal.self
      case "ContractRule":
        return ContractRule.self
      case "ContractSigner":
        return ContractSigner.self
      case "ContractTerm":
        return ContractTerm.self
      case "ContractTermActor":
        return ContractTermActor.self
      case "ContractTermValuedItem":
        return ContractTermValuedItem.self
      case "ContractValuedItem":
        return ContractValuedItem.self
      case "Count":
        return Count.self
      case "Coverage":
        return Coverage.self
      case "DataElement":
        return DataElement.self
      case "DataElementContact":
        return DataElementContact.self
      case "DataElementMapping":
        return DataElementMapping.self
      case "DetectedIssue":
        return DetectedIssue.self
      case "DetectedIssueMitigation":
        return DetectedIssueMitigation.self
      case "Device":
        return Device.self
      case "DeviceComponent":
        return DeviceComponent.self
      case "DeviceComponentProductionSpecification":
        return DeviceComponentProductionSpecification.self
      case "DeviceMetric":
        return DeviceMetric.self
      case "DeviceMetricCalibration":
        return DeviceMetricCalibration.self
      case "DeviceUseRequest":
        return DeviceUseRequest.self
      case "DeviceUseStatement":
        return DeviceUseStatement.self
      case "DiagnosticOrder":
        return DiagnosticOrder.self
      case "DiagnosticOrderEvent":
        return DiagnosticOrderEvent.self
      case "DiagnosticOrderItem":
        return DiagnosticOrderItem.self
      case "DiagnosticReport":
        return DiagnosticReport.self
      case "DiagnosticReportImage":
        return DiagnosticReportImage.self
      case "Distance":
        return Distance.self
      case "DocumentManifest":
        return DocumentManifest.self
      case "DocumentManifestContent":
        return DocumentManifestContent.self
      case "DocumentManifestRelated":
        return DocumentManifestRelated.self
      case "DocumentReference":
        return DocumentReference.self
      case "DocumentReferenceContent":
        return DocumentReferenceContent.self
      case "DocumentReferenceContext":
        return DocumentReferenceContext.self
      case "DocumentReferenceContextRelated":
        return DocumentReferenceContextRelated.self
      case "DocumentReferenceRelatesTo":
        return DocumentReferenceRelatesTo.self
      case "DomainResource":
        return DomainResource.self
      case "Duration":
        return Duration.self
      case "Element":
        return Element.self
      case "ElementDefinition":
        return ElementDefinition.self
      case "ElementDefinitionBase":
        return ElementDefinitionBase.self
      case "ElementDefinitionBinding":
        return ElementDefinitionBinding.self
      case "ElementDefinitionConstraint":
        return ElementDefinitionConstraint.self
      case "ElementDefinitionMapping":
        return ElementDefinitionMapping.self
      case "ElementDefinitionSlicing":
        return ElementDefinitionSlicing.self
      case "ElementDefinitionType":
        return ElementDefinitionType.self
      case "EligibilityRequest":
        return EligibilityRequest.self
      case "EligibilityResponse":
        return EligibilityResponse.self
      case "Encounter":
        return Encounter.self
      case "EncounterHospitalization":
        return EncounterHospitalization.self
      case "EncounterLocation":
        return EncounterLocation.self
      case "EncounterParticipant":
        return EncounterParticipant.self
      case "EncounterStatusHistory":
        return EncounterStatusHistory.self
      case "EnrollmentRequest":
        return EnrollmentRequest.self
      case "EnrollmentResponse":
        return EnrollmentResponse.self
      case "EpisodeOfCare":
        return EpisodeOfCare.self
      case "EpisodeOfCareCareTeam":
        return EpisodeOfCareCareTeam.self
      case "EpisodeOfCareStatusHistory":
        return EpisodeOfCareStatusHistory.self
      case "ExplanationOfBenefit":
        return ExplanationOfBenefit.self
      case "Extension":
        return Extension.self
      case "FamilyMemberHistory":
        return FamilyMemberHistory.self
      case "FamilyMemberHistoryCondition":
        return FamilyMemberHistoryCondition.self
      case "Flag":
        return Flag.self
      case "Goal":
        return Goal.self
      case "GoalOutcome":
        return GoalOutcome.self
      case "Group":
        return Group.self
      case "GroupCharacteristic":
        return GroupCharacteristic.self
      case "GroupMember":
        return GroupMember.self
      case "HealthcareService":
        return HealthcareService.self
      case "HealthcareServiceAvailableTime":
        return HealthcareServiceAvailableTime.self
      case "HealthcareServiceNotAvailable":
        return HealthcareServiceNotAvailable.self
      case "HealthcareServiceServiceType":
        return HealthcareServiceServiceType.self
      case "HumanName":
        return HumanName.self
      case "Identifier":
        return Identifier.self
      case "ImagingObjectSelection":
        return ImagingObjectSelection.self
      case "ImagingObjectSelectionStudy":
        return ImagingObjectSelectionStudy.self
      case "ImagingObjectSelectionStudySeries":
        return ImagingObjectSelectionStudySeries.self
      case "ImagingObjectSelectionStudySeriesInstance":
        return ImagingObjectSelectionStudySeriesInstance.self
      case "ImagingObjectSelectionStudySeriesInstanceFrames":
        return ImagingObjectSelectionStudySeriesInstanceFrames.self
      case "ImagingStudy":
        return ImagingStudy.self
      case "ImagingStudySeries":
        return ImagingStudySeries.self
      case "ImagingStudySeriesInstance":
        return ImagingStudySeriesInstance.self
      case "Immunization":
        return Immunization.self
      case "ImmunizationExplanation":
        return ImmunizationExplanation.self
      case "ImmunizationReaction":
        return ImmunizationReaction.self
      case "ImmunizationRecommendation":
        return ImmunizationRecommendation.self
      case "ImmunizationRecommendationRecommendation":
        return ImmunizationRecommendationRecommendation.self
      case "ImmunizationRecommendationRecommendationDateCriterion":
        return ImmunizationRecommendationRecommendationDateCriterion.self
      case "ImmunizationRecommendationRecommendationProtocol":
        return ImmunizationRecommendationRecommendationProtocol.self
      case "ImmunizationVaccinationProtocol":
        return ImmunizationVaccinationProtocol.self
      case "ImplementationGuide":
        return ImplementationGuide.self
      case "ImplementationGuideContact":
        return ImplementationGuideContact.self
      case "ImplementationGuideDependency":
        return ImplementationGuideDependency.self
      case "ImplementationGuideGlobal":
        return ImplementationGuideGlobal.self
      case "ImplementationGuidePackage":
        return ImplementationGuidePackage.self
      case "ImplementationGuidePackageResource":
        return ImplementationGuidePackageResource.self
      case "ImplementationGuidePage":
        return ImplementationGuidePage.self
      case "List":
        return List.self
      case "ListEntry":
        return ListEntry.self
      case "Location":
        return Location.self
      case "LocationPosition":
        return LocationPosition.self
      case "Media":
        return Media.self
      case "Medication":
        return Medication.self
      case "MedicationAdministration":
        return MedicationAdministration.self
      case "MedicationAdministrationDosage":
        return MedicationAdministrationDosage.self
      case "MedicationDispense":
        return MedicationDispense.self
      case "MedicationDispenseDosageInstruction":
        return MedicationDispenseDosageInstruction.self
      case "MedicationDispenseSubstitution":
        return MedicationDispenseSubstitution.self
      case "MedicationOrder":
        return MedicationOrder.self
      case "MedicationOrderDispenseRequest":
        return MedicationOrderDispenseRequest.self
      case "MedicationOrderDosageInstruction":
        return MedicationOrderDosageInstruction.self
      case "MedicationOrderSubstitution":
        return MedicationOrderSubstitution.self
      case "MedicationPackage":
        return MedicationPackage.self
      case "MedicationPackageContent":
        return MedicationPackageContent.self
      case "MedicationProduct":
        return MedicationProduct.self
      case "MedicationProductBatch":
        return MedicationProductBatch.self
      case "MedicationProductIngredient":
        return MedicationProductIngredient.self
      case "MedicationStatement":
        return MedicationStatement.self
      case "MedicationStatementDosage":
        return MedicationStatementDosage.self
      case "MessageHeader":
        return MessageHeader.self
      case "MessageHeaderDestination":
        return MessageHeaderDestination.self
      case "MessageHeaderResponse":
        return MessageHeaderResponse.self
      case "MessageHeaderSource":
        return MessageHeaderSource.self
      case "Meta":
        return Meta.self
      case "Money":
        return Money.self
      case "NamingSystem":
        return NamingSystem.self
      case "NamingSystemContact":
        return NamingSystemContact.self
      case "NamingSystemUniqueId":
        return NamingSystemUniqueId.self
      case "Narrative":
        return Narrative.self
      case "NutritionOrder":
        return NutritionOrder.self
      case "NutritionOrderEnteralFormula":
        return NutritionOrderEnteralFormula.self
      case "NutritionOrderEnteralFormulaAdministration":
        return NutritionOrderEnteralFormulaAdministration.self
      case "NutritionOrderOralDiet":
        return NutritionOrderOralDiet.self
      case "NutritionOrderOralDietNutrient":
        return NutritionOrderOralDietNutrient.self
      case "NutritionOrderOralDietTexture":
        return NutritionOrderOralDietTexture.self
      case "NutritionOrderSupplement":
        return NutritionOrderSupplement.self
      case "Observation":
        return Observation.self
      case "ObservationComponent":
        return ObservationComponent.self
      case "ObservationReferenceRange":
        return ObservationReferenceRange.self
      case "ObservationRelated":
        return ObservationRelated.self
      case "OperationDefinition":
        return OperationDefinition.self
      case "OperationDefinitionContact":
        return OperationDefinitionContact.self
      case "OperationDefinitionParameter":
        return OperationDefinitionParameter.self
      case "OperationDefinitionParameterBinding":
        return OperationDefinitionParameterBinding.self
      case "OperationOutcome":
        return OperationOutcome.self
      case "OperationOutcomeIssue":
        return OperationOutcomeIssue.self
      case "Order":
        return Order.self
      case "OrderResponse":
        return OrderResponse.self
      case "OrderWhen":
        return OrderWhen.self
      case "Organization":
        return Organization.self
      case "OrganizationContact":
        return OrganizationContact.self
      case "Parameters":
        return Parameters.self
      case "ParametersParameter":
        return ParametersParameter.self
      case "Patient":
        return Patient.self
      case "PatientAnimal":
        return PatientAnimal.self
      case "PatientCommunication":
        return PatientCommunication.self
      case "PatientContact":
        return PatientContact.self
      case "PatientLink":
        return PatientLink.self
      case "PaymentNotice":
        return PaymentNotice.self
      case "PaymentReconciliation":
        return PaymentReconciliation.self
      case "PaymentReconciliationDetail":
        return PaymentReconciliationDetail.self
      case "PaymentReconciliationNote":
        return PaymentReconciliationNote.self
      case "Period":
        return Period.self
      case "Person":
        return Person.self
      case "PersonLink":
        return PersonLink.self
      case "Practitioner":
        return Practitioner.self
      case "PractitionerPractitionerRole":
        return PractitionerPractitionerRole.self
      case "PractitionerQualification":
        return PractitionerQualification.self
      case "Procedure":
        return Procedure.self
      case "ProcedureFocalDevice":
        return ProcedureFocalDevice.self
      case "ProcedurePerformer":
        return ProcedurePerformer.self
      case "ProcedureRequest":
        return ProcedureRequest.self
      case "ProcessRequest":
        return ProcessRequest.self
      case "ProcessRequestItem":
        return ProcessRequestItem.self
      case "ProcessResponse":
        return ProcessResponse.self
      case "ProcessResponseNotes":
        return ProcessResponseNotes.self
      case "Provenance":
        return Provenance.self
      case "ProvenanceAgent":
        return ProvenanceAgent.self
      case "ProvenanceAgentRelatedAgent":
        return ProvenanceAgentRelatedAgent.self
      case "ProvenanceEntity":
        return ProvenanceEntity.self
      case "Quantity":
        return Quantity.self
      case "Questionnaire":
        return Questionnaire.self
      case "QuestionnaireGroup":
        return QuestionnaireGroup.self
      case "QuestionnaireGroupQuestion":
        return QuestionnaireGroupQuestion.self
      case "QuestionnaireResponse":
        return QuestionnaireResponse.self
      case "QuestionnaireResponseGroup":
        return QuestionnaireResponseGroup.self
      case "QuestionnaireResponseGroupQuestion":
        return QuestionnaireResponseGroupQuestion.self
      case "QuestionnaireResponseGroupQuestionAnswer":
        return QuestionnaireResponseGroupQuestionAnswer.self
      case "Range":
        return Range.self
      case "Ratio":
        return Ratio.self
      case "Reference":
        return Reference.self
      case "ReferralRequest":
        return ReferralRequest.self
      case "RelatedPerson":
        return RelatedPerson.self
      case "Resource":
        return Resource.self
      case "RiskAssessment":
        return RiskAssessment.self
      case "RiskAssessmentPrediction":
        return RiskAssessmentPrediction.self
      case "SampledData":
        return SampledData.self
      case "Schedule":
        return Schedule.self
      case "SearchParameter":
        return SearchParameter.self
      case "SearchParameterContact":
        return SearchParameterContact.self
      case "Signature":
        return Signature.self
      case "Slot":
        return Slot.self
      case "Specimen":
        return Specimen.self
      case "SpecimenCollection":
        return SpecimenCollection.self
      case "SpecimenContainer":
        return SpecimenContainer.self
      case "SpecimenTreatment":
        return SpecimenTreatment.self
      case "StructureDefinition":
        return StructureDefinition.self
      case "StructureDefinitionContact":
        return StructureDefinitionContact.self
      case "StructureDefinitionDifferential":
        return StructureDefinitionDifferential.self
      case "StructureDefinitionMapping":
        return StructureDefinitionMapping.self
      case "StructureDefinitionSnapshot":
        return StructureDefinitionSnapshot.self
      case "Subscription":
        return Subscription.self
      case "SubscriptionChannel":
        return SubscriptionChannel.self
      case "Substance":
        return Substance.self
      case "SubstanceIngredient":
        return SubstanceIngredient.self
      case "SubstanceInstance":
        return SubstanceInstance.self
      case "SupplyDelivery":
        return SupplyDelivery.self
      case "SupplyRequest":
        return SupplyRequest.self
      case "SupplyRequestWhen":
        return SupplyRequestWhen.self
      case "TestScript":
        return TestScript.self
      case "TestScriptContact":
        return TestScriptContact.self
      case "TestScriptFixture":
        return TestScriptFixture.self
      case "TestScriptMetadata":
        return TestScriptMetadata.self
      case "TestScriptMetadataCapability":
        return TestScriptMetadataCapability.self
      case "TestScriptMetadataLink":
        return TestScriptMetadataLink.self
      case "TestScriptSetup":
        return TestScriptSetup.self
      case "TestScriptSetupAction":
        return TestScriptSetupAction.self
      case "TestScriptSetupActionAssert":
        return TestScriptSetupActionAssert.self
      case "TestScriptSetupActionOperation":
        return TestScriptSetupActionOperation.self
      case "TestScriptSetupActionOperationRequestHeader":
        return TestScriptSetupActionOperationRequestHeader.self
      case "TestScriptTeardown":
        return TestScriptTeardown.self
      case "TestScriptTeardownAction":
        return TestScriptTeardownAction.self
      case "TestScriptTest":
        return TestScriptTest.self
      case "TestScriptTestAction":
        return TestScriptTestAction.self
      case "TestScriptVariable":
        return TestScriptVariable.self
      case "Timing":
        return Timing.self
      case "TimingRepeat":
        return TimingRepeat.self
      case "ValueSet":
        return ValueSet.self
      case "ValueSetCodeSystem":
        return ValueSetCodeSystem.self
      case "ValueSetCodeSystemConcept":
        return ValueSetCodeSystemConcept.self
      case "ValueSetCodeSystemConceptDesignation":
        return ValueSetCodeSystemConceptDesignation.self
      case "ValueSetCompose":
        return ValueSetCompose.self
      case "ValueSetComposeInclude":
        return ValueSetComposeInclude.self
      case "ValueSetComposeIncludeConcept":
        return ValueSetComposeIncludeConcept.self
      case "ValueSetComposeIncludeFilter":
        return ValueSetComposeIncludeFilter.self
      case "ValueSetContact":
        return ValueSetContact.self
      case "ValueSetExpansion":
        return ValueSetExpansion.self
      case "ValueSetExpansionContains":
        return ValueSetExpansionContains.self
      case "ValueSetExpansionParameter":
        return ValueSetExpansionParameter.self
      case "VisionPrescription":
        return VisionPrescription.self
      case "VisionPrescriptionDispense":
        return VisionPrescriptionDispense.self
      default:
        return FHIRAbstractBase.self
    }
  }
}

struct UnknownFhirDecodingTypeError: Error {
    var className: String
}
extension KeyedDecodingContainerProtocol {
    func decodeFHIRAbstractBaseIfPresent(_ className: String, forKey key: Self.Key) throws -> FHIRAbstractBase? {
        switch className {
      case "Account":
        return try decodeIfPresent(Account.self, forKey: key)
      case "Address":
        return try decodeIfPresent(Address.self, forKey: key)
      case "Age":
        return try decodeIfPresent(Age.self, forKey: key)
      case "AllergyIntolerance":
        return try decodeIfPresent(AllergyIntolerance.self, forKey: key)
      case "AllergyIntoleranceReaction":
        return try decodeIfPresent(AllergyIntoleranceReaction.self, forKey: key)
      case "Annotation":
        return try decodeIfPresent(Annotation.self, forKey: key)
      case "Appointment":
        return try decodeIfPresent(Appointment.self, forKey: key)
      case "AppointmentParticipant":
        return try decodeIfPresent(AppointmentParticipant.self, forKey: key)
      case "AppointmentResponse":
        return try decodeIfPresent(AppointmentResponse.self, forKey: key)
      case "Attachment":
        return try decodeIfPresent(Attachment.self, forKey: key)
      case "AuditEvent":
        return try decodeIfPresent(AuditEvent.self, forKey: key)
      case "AuditEventEvent":
        return try decodeIfPresent(AuditEventEvent.self, forKey: key)
      case "AuditEventObject":
        return try decodeIfPresent(AuditEventObject.self, forKey: key)
      case "AuditEventObjectDetail":
        return try decodeIfPresent(AuditEventObjectDetail.self, forKey: key)
      case "AuditEventParticipant":
        return try decodeIfPresent(AuditEventParticipant.self, forKey: key)
      case "AuditEventParticipantNetwork":
        return try decodeIfPresent(AuditEventParticipantNetwork.self, forKey: key)
      case "AuditEventSource":
        return try decodeIfPresent(AuditEventSource.self, forKey: key)
      case "BackboneElement":
        return try decodeIfPresent(BackboneElement.self, forKey: key)
      case "Basic":
        return try decodeIfPresent(Basic.self, forKey: key)
      case "Binary":
        return try decodeIfPresent(Binary.self, forKey: key)
      case "BodySite":
        return try decodeIfPresent(BodySite.self, forKey: key)
      case "Bundle":
        return try decodeIfPresent(Bundle.self, forKey: key)
      case "BundleEntry":
        return try decodeIfPresent(BundleEntry.self, forKey: key)
      case "BundleEntryRequest":
        return try decodeIfPresent(BundleEntryRequest.self, forKey: key)
      case "BundleEntryResponse":
        return try decodeIfPresent(BundleEntryResponse.self, forKey: key)
      case "BundleEntrySearch":
        return try decodeIfPresent(BundleEntrySearch.self, forKey: key)
      case "BundleLink":
        return try decodeIfPresent(BundleLink.self, forKey: key)
      case "CarePlan":
        return try decodeIfPresent(CarePlan.self, forKey: key)
      case "CarePlanActivity":
        return try decodeIfPresent(CarePlanActivity.self, forKey: key)
      case "CarePlanActivityDetail":
        return try decodeIfPresent(CarePlanActivityDetail.self, forKey: key)
      case "CarePlanParticipant":
        return try decodeIfPresent(CarePlanParticipant.self, forKey: key)
      case "CarePlanRelatedPlan":
        return try decodeIfPresent(CarePlanRelatedPlan.self, forKey: key)
      case "Claim":
        return try decodeIfPresent(Claim.self, forKey: key)
      case "ClaimCoverage":
        return try decodeIfPresent(ClaimCoverage.self, forKey: key)
      case "ClaimDiagnosis":
        return try decodeIfPresent(ClaimDiagnosis.self, forKey: key)
      case "ClaimItem":
        return try decodeIfPresent(ClaimItem.self, forKey: key)
      case "ClaimItemDetail":
        return try decodeIfPresent(ClaimItemDetail.self, forKey: key)
      case "ClaimItemDetailSubDetail":
        return try decodeIfPresent(ClaimItemDetailSubDetail.self, forKey: key)
      case "ClaimItemProsthesis":
        return try decodeIfPresent(ClaimItemProsthesis.self, forKey: key)
      case "ClaimMissingTeeth":
        return try decodeIfPresent(ClaimMissingTeeth.self, forKey: key)
      case "ClaimPayee":
        return try decodeIfPresent(ClaimPayee.self, forKey: key)
      case "ClaimResponse":
        return try decodeIfPresent(ClaimResponse.self, forKey: key)
      case "ClaimResponseAddItem":
        return try decodeIfPresent(ClaimResponseAddItem.self, forKey: key)
      case "ClaimResponseAddItemAdjudication":
        return try decodeIfPresent(ClaimResponseAddItemAdjudication.self, forKey: key)
      case "ClaimResponseAddItemDetail":
        return try decodeIfPresent(ClaimResponseAddItemDetail.self, forKey: key)
      case "ClaimResponseAddItemDetailAdjudication":
        return try decodeIfPresent(ClaimResponseAddItemDetailAdjudication.self, forKey: key)
      case "ClaimResponseCoverage":
        return try decodeIfPresent(ClaimResponseCoverage.self, forKey: key)
      case "ClaimResponseError":
        return try decodeIfPresent(ClaimResponseError.self, forKey: key)
      case "ClaimResponseItem":
        return try decodeIfPresent(ClaimResponseItem.self, forKey: key)
      case "ClaimResponseItemAdjudication":
        return try decodeIfPresent(ClaimResponseItemAdjudication.self, forKey: key)
      case "ClaimResponseItemDetail":
        return try decodeIfPresent(ClaimResponseItemDetail.self, forKey: key)
      case "ClaimResponseItemDetailAdjudication":
        return try decodeIfPresent(ClaimResponseItemDetailAdjudication.self, forKey: key)
      case "ClaimResponseItemDetailSubDetail":
        return try decodeIfPresent(ClaimResponseItemDetailSubDetail.self, forKey: key)
      case "ClaimResponseItemDetailSubDetailAdjudication":
        return try decodeIfPresent(ClaimResponseItemDetailSubDetailAdjudication.self, forKey: key)
      case "ClaimResponseNote":
        return try decodeIfPresent(ClaimResponseNote.self, forKey: key)
      case "ClinicalImpression":
        return try decodeIfPresent(ClinicalImpression.self, forKey: key)
      case "ClinicalImpressionFinding":
        return try decodeIfPresent(ClinicalImpressionFinding.self, forKey: key)
      case "ClinicalImpressionInvestigations":
        return try decodeIfPresent(ClinicalImpressionInvestigations.self, forKey: key)
      case "ClinicalImpressionRuledOut":
        return try decodeIfPresent(ClinicalImpressionRuledOut.self, forKey: key)
      case "CodeableConcept":
        return try decodeIfPresent(CodeableConcept.self, forKey: key)
      case "Coding":
        return try decodeIfPresent(Coding.self, forKey: key)
      case "Communication":
        return try decodeIfPresent(Communication.self, forKey: key)
      case "CommunicationPayload":
        return try decodeIfPresent(CommunicationPayload.self, forKey: key)
      case "CommunicationRequest":
        return try decodeIfPresent(CommunicationRequest.self, forKey: key)
      case "CommunicationRequestPayload":
        return try decodeIfPresent(CommunicationRequestPayload.self, forKey: key)
      case "Composition":
        return try decodeIfPresent(Composition.self, forKey: key)
      case "CompositionAttester":
        return try decodeIfPresent(CompositionAttester.self, forKey: key)
      case "CompositionEvent":
        return try decodeIfPresent(CompositionEvent.self, forKey: key)
      case "CompositionSection":
        return try decodeIfPresent(CompositionSection.self, forKey: key)
      case "ConceptMap":
        return try decodeIfPresent(ConceptMap.self, forKey: key)
      case "ConceptMapContact":
        return try decodeIfPresent(ConceptMapContact.self, forKey: key)
      case "ConceptMapElement":
        return try decodeIfPresent(ConceptMapElement.self, forKey: key)
      case "ConceptMapElementTarget":
        return try decodeIfPresent(ConceptMapElementTarget.self, forKey: key)
      case "ConceptMapElementTargetDependsOn":
        return try decodeIfPresent(ConceptMapElementTargetDependsOn.self, forKey: key)
      case "Condition":
        return try decodeIfPresent(Condition.self, forKey: key)
      case "ConditionEvidence":
        return try decodeIfPresent(ConditionEvidence.self, forKey: key)
      case "ConditionStage":
        return try decodeIfPresent(ConditionStage.self, forKey: key)
      case "Conformance":
        return try decodeIfPresent(Conformance.self, forKey: key)
      case "ConformanceContact":
        return try decodeIfPresent(ConformanceContact.self, forKey: key)
      case "ConformanceDocument":
        return try decodeIfPresent(ConformanceDocument.self, forKey: key)
      case "ConformanceImplementation":
        return try decodeIfPresent(ConformanceImplementation.self, forKey: key)
      case "ConformanceMessaging":
        return try decodeIfPresent(ConformanceMessaging.self, forKey: key)
      case "ConformanceMessagingEndpoint":
        return try decodeIfPresent(ConformanceMessagingEndpoint.self, forKey: key)
      case "ConformanceMessagingEvent":
        return try decodeIfPresent(ConformanceMessagingEvent.self, forKey: key)
      case "ConformanceRest":
        return try decodeIfPresent(ConformanceRest.self, forKey: key)
      case "ConformanceRestInteraction":
        return try decodeIfPresent(ConformanceRestInteraction.self, forKey: key)
      case "ConformanceRestOperation":
        return try decodeIfPresent(ConformanceRestOperation.self, forKey: key)
      case "ConformanceRestResource":
        return try decodeIfPresent(ConformanceRestResource.self, forKey: key)
      case "ConformanceRestResourceInteraction":
        return try decodeIfPresent(ConformanceRestResourceInteraction.self, forKey: key)
      case "ConformanceRestResourceSearchParam":
        return try decodeIfPresent(ConformanceRestResourceSearchParam.self, forKey: key)
      case "ConformanceRestSecurity":
        return try decodeIfPresent(ConformanceRestSecurity.self, forKey: key)
      case "ConformanceRestSecurityCertificate":
        return try decodeIfPresent(ConformanceRestSecurityCertificate.self, forKey: key)
      case "ConformanceSoftware":
        return try decodeIfPresent(ConformanceSoftware.self, forKey: key)
      case "ContactPoint":
        return try decodeIfPresent(ContactPoint.self, forKey: key)
      case "Contract":
        return try decodeIfPresent(Contract.self, forKey: key)
      case "ContractActor":
        return try decodeIfPresent(ContractActor.self, forKey: key)
      case "ContractFriendly":
        return try decodeIfPresent(ContractFriendly.self, forKey: key)
      case "ContractLegal":
        return try decodeIfPresent(ContractLegal.self, forKey: key)
      case "ContractRule":
        return try decodeIfPresent(ContractRule.self, forKey: key)
      case "ContractSigner":
        return try decodeIfPresent(ContractSigner.self, forKey: key)
      case "ContractTerm":
        return try decodeIfPresent(ContractTerm.self, forKey: key)
      case "ContractTermActor":
        return try decodeIfPresent(ContractTermActor.self, forKey: key)
      case "ContractTermValuedItem":
        return try decodeIfPresent(ContractTermValuedItem.self, forKey: key)
      case "ContractValuedItem":
        return try decodeIfPresent(ContractValuedItem.self, forKey: key)
      case "Count":
        return try decodeIfPresent(Count.self, forKey: key)
      case "Coverage":
        return try decodeIfPresent(Coverage.self, forKey: key)
      case "DataElement":
        return try decodeIfPresent(DataElement.self, forKey: key)
      case "DataElementContact":
        return try decodeIfPresent(DataElementContact.self, forKey: key)
      case "DataElementMapping":
        return try decodeIfPresent(DataElementMapping.self, forKey: key)
      case "DetectedIssue":
        return try decodeIfPresent(DetectedIssue.self, forKey: key)
      case "DetectedIssueMitigation":
        return try decodeIfPresent(DetectedIssueMitigation.self, forKey: key)
      case "Device":
        return try decodeIfPresent(Device.self, forKey: key)
      case "DeviceComponent":
        return try decodeIfPresent(DeviceComponent.self, forKey: key)
      case "DeviceComponentProductionSpecification":
        return try decodeIfPresent(DeviceComponentProductionSpecification.self, forKey: key)
      case "DeviceMetric":
        return try decodeIfPresent(DeviceMetric.self, forKey: key)
      case "DeviceMetricCalibration":
        return try decodeIfPresent(DeviceMetricCalibration.self, forKey: key)
      case "DeviceUseRequest":
        return try decodeIfPresent(DeviceUseRequest.self, forKey: key)
      case "DeviceUseStatement":
        return try decodeIfPresent(DeviceUseStatement.self, forKey: key)
      case "DiagnosticOrder":
        return try decodeIfPresent(DiagnosticOrder.self, forKey: key)
      case "DiagnosticOrderEvent":
        return try decodeIfPresent(DiagnosticOrderEvent.self, forKey: key)
      case "DiagnosticOrderItem":
        return try decodeIfPresent(DiagnosticOrderItem.self, forKey: key)
      case "DiagnosticReport":
        return try decodeIfPresent(DiagnosticReport.self, forKey: key)
      case "DiagnosticReportImage":
        return try decodeIfPresent(DiagnosticReportImage.self, forKey: key)
      case "Distance":
        return try decodeIfPresent(Distance.self, forKey: key)
      case "DocumentManifest":
        return try decodeIfPresent(DocumentManifest.self, forKey: key)
      case "DocumentManifestContent":
        return try decodeIfPresent(DocumentManifestContent.self, forKey: key)
      case "DocumentManifestRelated":
        return try decodeIfPresent(DocumentManifestRelated.self, forKey: key)
      case "DocumentReference":
        return try decodeIfPresent(DocumentReference.self, forKey: key)
      case "DocumentReferenceContent":
        return try decodeIfPresent(DocumentReferenceContent.self, forKey: key)
      case "DocumentReferenceContext":
        return try decodeIfPresent(DocumentReferenceContext.self, forKey: key)
      case "DocumentReferenceContextRelated":
        return try decodeIfPresent(DocumentReferenceContextRelated.self, forKey: key)
      case "DocumentReferenceRelatesTo":
        return try decodeIfPresent(DocumentReferenceRelatesTo.self, forKey: key)
      case "DomainResource":
        return try decodeIfPresent(DomainResource.self, forKey: key)
      case "Duration":
        return try decodeIfPresent(Duration.self, forKey: key)
      case "Element":
        return try decodeIfPresent(Element.self, forKey: key)
      case "ElementDefinition":
        return try decodeIfPresent(ElementDefinition.self, forKey: key)
      case "ElementDefinitionBase":
        return try decodeIfPresent(ElementDefinitionBase.self, forKey: key)
      case "ElementDefinitionBinding":
        return try decodeIfPresent(ElementDefinitionBinding.self, forKey: key)
      case "ElementDefinitionConstraint":
        return try decodeIfPresent(ElementDefinitionConstraint.self, forKey: key)
      case "ElementDefinitionMapping":
        return try decodeIfPresent(ElementDefinitionMapping.self, forKey: key)
      case "ElementDefinitionSlicing":
        return try decodeIfPresent(ElementDefinitionSlicing.self, forKey: key)
      case "ElementDefinitionType":
        return try decodeIfPresent(ElementDefinitionType.self, forKey: key)
      case "EligibilityRequest":
        return try decodeIfPresent(EligibilityRequest.self, forKey: key)
      case "EligibilityResponse":
        return try decodeIfPresent(EligibilityResponse.self, forKey: key)
      case "Encounter":
        return try decodeIfPresent(Encounter.self, forKey: key)
      case "EncounterHospitalization":
        return try decodeIfPresent(EncounterHospitalization.self, forKey: key)
      case "EncounterLocation":
        return try decodeIfPresent(EncounterLocation.self, forKey: key)
      case "EncounterParticipant":
        return try decodeIfPresent(EncounterParticipant.self, forKey: key)
      case "EncounterStatusHistory":
        return try decodeIfPresent(EncounterStatusHistory.self, forKey: key)
      case "EnrollmentRequest":
        return try decodeIfPresent(EnrollmentRequest.self, forKey: key)
      case "EnrollmentResponse":
        return try decodeIfPresent(EnrollmentResponse.self, forKey: key)
      case "EpisodeOfCare":
        return try decodeIfPresent(EpisodeOfCare.self, forKey: key)
      case "EpisodeOfCareCareTeam":
        return try decodeIfPresent(EpisodeOfCareCareTeam.self, forKey: key)
      case "EpisodeOfCareStatusHistory":
        return try decodeIfPresent(EpisodeOfCareStatusHistory.self, forKey: key)
      case "ExplanationOfBenefit":
        return try decodeIfPresent(ExplanationOfBenefit.self, forKey: key)
      case "Extension":
        return try decodeIfPresent(Extension.self, forKey: key)
      case "FamilyMemberHistory":
        return try decodeIfPresent(FamilyMemberHistory.self, forKey: key)
      case "FamilyMemberHistoryCondition":
        return try decodeIfPresent(FamilyMemberHistoryCondition.self, forKey: key)
      case "Flag":
        return try decodeIfPresent(Flag.self, forKey: key)
      case "Goal":
        return try decodeIfPresent(Goal.self, forKey: key)
      case "GoalOutcome":
        return try decodeIfPresent(GoalOutcome.self, forKey: key)
      case "Group":
        return try decodeIfPresent(Group.self, forKey: key)
      case "GroupCharacteristic":
        return try decodeIfPresent(GroupCharacteristic.self, forKey: key)
      case "GroupMember":
        return try decodeIfPresent(GroupMember.self, forKey: key)
      case "HealthcareService":
        return try decodeIfPresent(HealthcareService.self, forKey: key)
      case "HealthcareServiceAvailableTime":
        return try decodeIfPresent(HealthcareServiceAvailableTime.self, forKey: key)
      case "HealthcareServiceNotAvailable":
        return try decodeIfPresent(HealthcareServiceNotAvailable.self, forKey: key)
      case "HealthcareServiceServiceType":
        return try decodeIfPresent(HealthcareServiceServiceType.self, forKey: key)
      case "HumanName":
        return try decodeIfPresent(HumanName.self, forKey: key)
      case "Identifier":
        return try decodeIfPresent(Identifier.self, forKey: key)
      case "ImagingObjectSelection":
        return try decodeIfPresent(ImagingObjectSelection.self, forKey: key)
      case "ImagingObjectSelectionStudy":
        return try decodeIfPresent(ImagingObjectSelectionStudy.self, forKey: key)
      case "ImagingObjectSelectionStudySeries":
        return try decodeIfPresent(ImagingObjectSelectionStudySeries.self, forKey: key)
      case "ImagingObjectSelectionStudySeriesInstance":
        return try decodeIfPresent(ImagingObjectSelectionStudySeriesInstance.self, forKey: key)
      case "ImagingObjectSelectionStudySeriesInstanceFrames":
        return try decodeIfPresent(ImagingObjectSelectionStudySeriesInstanceFrames.self, forKey: key)
      case "ImagingStudy":
        return try decodeIfPresent(ImagingStudy.self, forKey: key)
      case "ImagingStudySeries":
        return try decodeIfPresent(ImagingStudySeries.self, forKey: key)
      case "ImagingStudySeriesInstance":
        return try decodeIfPresent(ImagingStudySeriesInstance.self, forKey: key)
      case "Immunization":
        return try decodeIfPresent(Immunization.self, forKey: key)
      case "ImmunizationExplanation":
        return try decodeIfPresent(ImmunizationExplanation.self, forKey: key)
      case "ImmunizationReaction":
        return try decodeIfPresent(ImmunizationReaction.self, forKey: key)
      case "ImmunizationRecommendation":
        return try decodeIfPresent(ImmunizationRecommendation.self, forKey: key)
      case "ImmunizationRecommendationRecommendation":
        return try decodeIfPresent(ImmunizationRecommendationRecommendation.self, forKey: key)
      case "ImmunizationRecommendationRecommendationDateCriterion":
        return try decodeIfPresent(ImmunizationRecommendationRecommendationDateCriterion.self, forKey: key)
      case "ImmunizationRecommendationRecommendationProtocol":
        return try decodeIfPresent(ImmunizationRecommendationRecommendationProtocol.self, forKey: key)
      case "ImmunizationVaccinationProtocol":
        return try decodeIfPresent(ImmunizationVaccinationProtocol.self, forKey: key)
      case "ImplementationGuide":
        return try decodeIfPresent(ImplementationGuide.self, forKey: key)
      case "ImplementationGuideContact":
        return try decodeIfPresent(ImplementationGuideContact.self, forKey: key)
      case "ImplementationGuideDependency":
        return try decodeIfPresent(ImplementationGuideDependency.self, forKey: key)
      case "ImplementationGuideGlobal":
        return try decodeIfPresent(ImplementationGuideGlobal.self, forKey: key)
      case "ImplementationGuidePackage":
        return try decodeIfPresent(ImplementationGuidePackage.self, forKey: key)
      case "ImplementationGuidePackageResource":
        return try decodeIfPresent(ImplementationGuidePackageResource.self, forKey: key)
      case "ImplementationGuidePage":
        return try decodeIfPresent(ImplementationGuidePage.self, forKey: key)
      case "List":
        return try decodeIfPresent(List.self, forKey: key)
      case "ListEntry":
        return try decodeIfPresent(ListEntry.self, forKey: key)
      case "Location":
        return try decodeIfPresent(Location.self, forKey: key)
      case "LocationPosition":
        return try decodeIfPresent(LocationPosition.self, forKey: key)
      case "Media":
        return try decodeIfPresent(Media.self, forKey: key)
      case "Medication":
        return try decodeIfPresent(Medication.self, forKey: key)
      case "MedicationAdministration":
        return try decodeIfPresent(MedicationAdministration.self, forKey: key)
      case "MedicationAdministrationDosage":
        return try decodeIfPresent(MedicationAdministrationDosage.self, forKey: key)
      case "MedicationDispense":
        return try decodeIfPresent(MedicationDispense.self, forKey: key)
      case "MedicationDispenseDosageInstruction":
        return try decodeIfPresent(MedicationDispenseDosageInstruction.self, forKey: key)
      case "MedicationDispenseSubstitution":
        return try decodeIfPresent(MedicationDispenseSubstitution.self, forKey: key)
      case "MedicationOrder":
        return try decodeIfPresent(MedicationOrder.self, forKey: key)
      case "MedicationOrderDispenseRequest":
        return try decodeIfPresent(MedicationOrderDispenseRequest.self, forKey: key)
      case "MedicationOrderDosageInstruction":
        return try decodeIfPresent(MedicationOrderDosageInstruction.self, forKey: key)
      case "MedicationOrderSubstitution":
        return try decodeIfPresent(MedicationOrderSubstitution.self, forKey: key)
      case "MedicationPackage":
        return try decodeIfPresent(MedicationPackage.self, forKey: key)
      case "MedicationPackageContent":
        return try decodeIfPresent(MedicationPackageContent.self, forKey: key)
      case "MedicationProduct":
        return try decodeIfPresent(MedicationProduct.self, forKey: key)
      case "MedicationProductBatch":
        return try decodeIfPresent(MedicationProductBatch.self, forKey: key)
      case "MedicationProductIngredient":
        return try decodeIfPresent(MedicationProductIngredient.self, forKey: key)
      case "MedicationStatement":
        return try decodeIfPresent(MedicationStatement.self, forKey: key)
      case "MedicationStatementDosage":
        return try decodeIfPresent(MedicationStatementDosage.self, forKey: key)
      case "MessageHeader":
        return try decodeIfPresent(MessageHeader.self, forKey: key)
      case "MessageHeaderDestination":
        return try decodeIfPresent(MessageHeaderDestination.self, forKey: key)
      case "MessageHeaderResponse":
        return try decodeIfPresent(MessageHeaderResponse.self, forKey: key)
      case "MessageHeaderSource":
        return try decodeIfPresent(MessageHeaderSource.self, forKey: key)
      case "Meta":
        return try decodeIfPresent(Meta.self, forKey: key)
      case "Money":
        return try decodeIfPresent(Money.self, forKey: key)
      case "NamingSystem":
        return try decodeIfPresent(NamingSystem.self, forKey: key)
      case "NamingSystemContact":
        return try decodeIfPresent(NamingSystemContact.self, forKey: key)
      case "NamingSystemUniqueId":
        return try decodeIfPresent(NamingSystemUniqueId.self, forKey: key)
      case "Narrative":
        return try decodeIfPresent(Narrative.self, forKey: key)
      case "NutritionOrder":
        return try decodeIfPresent(NutritionOrder.self, forKey: key)
      case "NutritionOrderEnteralFormula":
        return try decodeIfPresent(NutritionOrderEnteralFormula.self, forKey: key)
      case "NutritionOrderEnteralFormulaAdministration":
        return try decodeIfPresent(NutritionOrderEnteralFormulaAdministration.self, forKey: key)
      case "NutritionOrderOralDiet":
        return try decodeIfPresent(NutritionOrderOralDiet.self, forKey: key)
      case "NutritionOrderOralDietNutrient":
        return try decodeIfPresent(NutritionOrderOralDietNutrient.self, forKey: key)
      case "NutritionOrderOralDietTexture":
        return try decodeIfPresent(NutritionOrderOralDietTexture.self, forKey: key)
      case "NutritionOrderSupplement":
        return try decodeIfPresent(NutritionOrderSupplement.self, forKey: key)
      case "Observation":
        return try decodeIfPresent(Observation.self, forKey: key)
      case "ObservationComponent":
        return try decodeIfPresent(ObservationComponent.self, forKey: key)
      case "ObservationReferenceRange":
        return try decodeIfPresent(ObservationReferenceRange.self, forKey: key)
      case "ObservationRelated":
        return try decodeIfPresent(ObservationRelated.self, forKey: key)
      case "OperationDefinition":
        return try decodeIfPresent(OperationDefinition.self, forKey: key)
      case "OperationDefinitionContact":
        return try decodeIfPresent(OperationDefinitionContact.self, forKey: key)
      case "OperationDefinitionParameter":
        return try decodeIfPresent(OperationDefinitionParameter.self, forKey: key)
      case "OperationDefinitionParameterBinding":
        return try decodeIfPresent(OperationDefinitionParameterBinding.self, forKey: key)
      case "OperationOutcome":
        return try decodeIfPresent(OperationOutcome.self, forKey: key)
      case "OperationOutcomeIssue":
        return try decodeIfPresent(OperationOutcomeIssue.self, forKey: key)
      case "Order":
        return try decodeIfPresent(Order.self, forKey: key)
      case "OrderResponse":
        return try decodeIfPresent(OrderResponse.self, forKey: key)
      case "OrderWhen":
        return try decodeIfPresent(OrderWhen.self, forKey: key)
      case "Organization":
        return try decodeIfPresent(Organization.self, forKey: key)
      case "OrganizationContact":
        return try decodeIfPresent(OrganizationContact.self, forKey: key)
      case "Parameters":
        return try decodeIfPresent(Parameters.self, forKey: key)
      case "ParametersParameter":
        return try decodeIfPresent(ParametersParameter.self, forKey: key)
      case "Patient":
        return try decodeIfPresent(Patient.self, forKey: key)
      case "PatientAnimal":
        return try decodeIfPresent(PatientAnimal.self, forKey: key)
      case "PatientCommunication":
        return try decodeIfPresent(PatientCommunication.self, forKey: key)
      case "PatientContact":
        return try decodeIfPresent(PatientContact.self, forKey: key)
      case "PatientLink":
        return try decodeIfPresent(PatientLink.self, forKey: key)
      case "PaymentNotice":
        return try decodeIfPresent(PaymentNotice.self, forKey: key)
      case "PaymentReconciliation":
        return try decodeIfPresent(PaymentReconciliation.self, forKey: key)
      case "PaymentReconciliationDetail":
        return try decodeIfPresent(PaymentReconciliationDetail.self, forKey: key)
      case "PaymentReconciliationNote":
        return try decodeIfPresent(PaymentReconciliationNote.self, forKey: key)
      case "Period":
        return try decodeIfPresent(Period.self, forKey: key)
      case "Person":
        return try decodeIfPresent(Person.self, forKey: key)
      case "PersonLink":
        return try decodeIfPresent(PersonLink.self, forKey: key)
      case "Practitioner":
        return try decodeIfPresent(Practitioner.self, forKey: key)
      case "PractitionerPractitionerRole":
        return try decodeIfPresent(PractitionerPractitionerRole.self, forKey: key)
      case "PractitionerQualification":
        return try decodeIfPresent(PractitionerQualification.self, forKey: key)
      case "Procedure":
        return try decodeIfPresent(Procedure.self, forKey: key)
      case "ProcedureFocalDevice":
        return try decodeIfPresent(ProcedureFocalDevice.self, forKey: key)
      case "ProcedurePerformer":
        return try decodeIfPresent(ProcedurePerformer.self, forKey: key)
      case "ProcedureRequest":
        return try decodeIfPresent(ProcedureRequest.self, forKey: key)
      case "ProcessRequest":
        return try decodeIfPresent(ProcessRequest.self, forKey: key)
      case "ProcessRequestItem":
        return try decodeIfPresent(ProcessRequestItem.self, forKey: key)
      case "ProcessResponse":
        return try decodeIfPresent(ProcessResponse.self, forKey: key)
      case "ProcessResponseNotes":
        return try decodeIfPresent(ProcessResponseNotes.self, forKey: key)
      case "Provenance":
        return try decodeIfPresent(Provenance.self, forKey: key)
      case "ProvenanceAgent":
        return try decodeIfPresent(ProvenanceAgent.self, forKey: key)
      case "ProvenanceAgentRelatedAgent":
        return try decodeIfPresent(ProvenanceAgentRelatedAgent.self, forKey: key)
      case "ProvenanceEntity":
        return try decodeIfPresent(ProvenanceEntity.self, forKey: key)
      case "Quantity":
        return try decodeIfPresent(Quantity.self, forKey: key)
      case "Questionnaire":
        return try decodeIfPresent(Questionnaire.self, forKey: key)
      case "QuestionnaireGroup":
        return try decodeIfPresent(QuestionnaireGroup.self, forKey: key)
      case "QuestionnaireGroupQuestion":
        return try decodeIfPresent(QuestionnaireGroupQuestion.self, forKey: key)
      case "QuestionnaireResponse":
        return try decodeIfPresent(QuestionnaireResponse.self, forKey: key)
      case "QuestionnaireResponseGroup":
        return try decodeIfPresent(QuestionnaireResponseGroup.self, forKey: key)
      case "QuestionnaireResponseGroupQuestion":
        return try decodeIfPresent(QuestionnaireResponseGroupQuestion.self, forKey: key)
      case "QuestionnaireResponseGroupQuestionAnswer":
        return try decodeIfPresent(QuestionnaireResponseGroupQuestionAnswer.self, forKey: key)
      case "Range":
        return try decodeIfPresent(Range.self, forKey: key)
      case "Ratio":
        return try decodeIfPresent(Ratio.self, forKey: key)
      case "Reference":
        return try decodeIfPresent(Reference.self, forKey: key)
      case "ReferralRequest":
        return try decodeIfPresent(ReferralRequest.self, forKey: key)
      case "RelatedPerson":
        return try decodeIfPresent(RelatedPerson.self, forKey: key)
      case "Resource":
        return try decodeIfPresent(Resource.self, forKey: key)
      case "RiskAssessment":
        return try decodeIfPresent(RiskAssessment.self, forKey: key)
      case "RiskAssessmentPrediction":
        return try decodeIfPresent(RiskAssessmentPrediction.self, forKey: key)
      case "SampledData":
        return try decodeIfPresent(SampledData.self, forKey: key)
      case "Schedule":
        return try decodeIfPresent(Schedule.self, forKey: key)
      case "SearchParameter":
        return try decodeIfPresent(SearchParameter.self, forKey: key)
      case "SearchParameterContact":
        return try decodeIfPresent(SearchParameterContact.self, forKey: key)
      case "Signature":
        return try decodeIfPresent(Signature.self, forKey: key)
      case "Slot":
        return try decodeIfPresent(Slot.self, forKey: key)
      case "Specimen":
        return try decodeIfPresent(Specimen.self, forKey: key)
      case "SpecimenCollection":
        return try decodeIfPresent(SpecimenCollection.self, forKey: key)
      case "SpecimenContainer":
        return try decodeIfPresent(SpecimenContainer.self, forKey: key)
      case "SpecimenTreatment":
        return try decodeIfPresent(SpecimenTreatment.self, forKey: key)
      case "StructureDefinition":
        return try decodeIfPresent(StructureDefinition.self, forKey: key)
      case "StructureDefinitionContact":
        return try decodeIfPresent(StructureDefinitionContact.self, forKey: key)
      case "StructureDefinitionDifferential":
        return try decodeIfPresent(StructureDefinitionDifferential.self, forKey: key)
      case "StructureDefinitionMapping":
        return try decodeIfPresent(StructureDefinitionMapping.self, forKey: key)
      case "StructureDefinitionSnapshot":
        return try decodeIfPresent(StructureDefinitionSnapshot.self, forKey: key)
      case "Subscription":
        return try decodeIfPresent(Subscription.self, forKey: key)
      case "SubscriptionChannel":
        return try decodeIfPresent(SubscriptionChannel.self, forKey: key)
      case "Substance":
        return try decodeIfPresent(Substance.self, forKey: key)
      case "SubstanceIngredient":
        return try decodeIfPresent(SubstanceIngredient.self, forKey: key)
      case "SubstanceInstance":
        return try decodeIfPresent(SubstanceInstance.self, forKey: key)
      case "SupplyDelivery":
        return try decodeIfPresent(SupplyDelivery.self, forKey: key)
      case "SupplyRequest":
        return try decodeIfPresent(SupplyRequest.self, forKey: key)
      case "SupplyRequestWhen":
        return try decodeIfPresent(SupplyRequestWhen.self, forKey: key)
      case "TestScript":
        return try decodeIfPresent(TestScript.self, forKey: key)
      case "TestScriptContact":
        return try decodeIfPresent(TestScriptContact.self, forKey: key)
      case "TestScriptFixture":
        return try decodeIfPresent(TestScriptFixture.self, forKey: key)
      case "TestScriptMetadata":
        return try decodeIfPresent(TestScriptMetadata.self, forKey: key)
      case "TestScriptMetadataCapability":
        return try decodeIfPresent(TestScriptMetadataCapability.self, forKey: key)
      case "TestScriptMetadataLink":
        return try decodeIfPresent(TestScriptMetadataLink.self, forKey: key)
      case "TestScriptSetup":
        return try decodeIfPresent(TestScriptSetup.self, forKey: key)
      case "TestScriptSetupAction":
        return try decodeIfPresent(TestScriptSetupAction.self, forKey: key)
      case "TestScriptSetupActionAssert":
        return try decodeIfPresent(TestScriptSetupActionAssert.self, forKey: key)
      case "TestScriptSetupActionOperation":
        return try decodeIfPresent(TestScriptSetupActionOperation.self, forKey: key)
      case "TestScriptSetupActionOperationRequestHeader":
        return try decodeIfPresent(TestScriptSetupActionOperationRequestHeader.self, forKey: key)
      case "TestScriptTeardown":
        return try decodeIfPresent(TestScriptTeardown.self, forKey: key)
      case "TestScriptTeardownAction":
        return try decodeIfPresent(TestScriptTeardownAction.self, forKey: key)
      case "TestScriptTest":
        return try decodeIfPresent(TestScriptTest.self, forKey: key)
      case "TestScriptTestAction":
        return try decodeIfPresent(TestScriptTestAction.self, forKey: key)
      case "TestScriptVariable":
        return try decodeIfPresent(TestScriptVariable.self, forKey: key)
      case "Timing":
        return try decodeIfPresent(Timing.self, forKey: key)
      case "TimingRepeat":
        return try decodeIfPresent(TimingRepeat.self, forKey: key)
      case "ValueSet":
        return try decodeIfPresent(ValueSet.self, forKey: key)
      case "ValueSetCodeSystem":
        return try decodeIfPresent(ValueSetCodeSystem.self, forKey: key)
      case "ValueSetCodeSystemConcept":
        return try decodeIfPresent(ValueSetCodeSystemConcept.self, forKey: key)
      case "ValueSetCodeSystemConceptDesignation":
        return try decodeIfPresent(ValueSetCodeSystemConceptDesignation.self, forKey: key)
      case "ValueSetCompose":
        return try decodeIfPresent(ValueSetCompose.self, forKey: key)
      case "ValueSetComposeInclude":
        return try decodeIfPresent(ValueSetComposeInclude.self, forKey: key)
      case "ValueSetComposeIncludeConcept":
        return try decodeIfPresent(ValueSetComposeIncludeConcept.self, forKey: key)
      case "ValueSetComposeIncludeFilter":
        return try decodeIfPresent(ValueSetComposeIncludeFilter.self, forKey: key)
      case "ValueSetContact":
        return try decodeIfPresent(ValueSetContact.self, forKey: key)
      case "ValueSetExpansion":
        return try decodeIfPresent(ValueSetExpansion.self, forKey: key)
      case "ValueSetExpansionContains":
        return try decodeIfPresent(ValueSetExpansionContains.self, forKey: key)
      case "ValueSetExpansionParameter":
        return try decodeIfPresent(ValueSetExpansionParameter.self, forKey: key)
      case "VisionPrescription":
        return try decodeIfPresent(VisionPrescription.self, forKey: key)
      case "VisionPrescriptionDispense":
        return try decodeIfPresent(VisionPrescriptionDispense.self, forKey: key)
      default:
        throw UnknownFhirDecodingTypeError(className: className)
      }
    }
}

extension UnkeyedDecodingContainer {
    mutating func decodeFHIRAbstractBase(_ className: String) throws -> FHIRAbstractBase {
        switch className {
            case "Account":
                return try decode(Account.self)
            case "Address":
                return try decode(Address.self)
            case "Age":
                return try decode(Age.self)
            case "AllergyIntolerance":
                return try decode(AllergyIntolerance.self)
            case "AllergyIntoleranceReaction":
                return try decode(AllergyIntoleranceReaction.self)
            case "Annotation":
                return try decode(Annotation.self)
            case "Appointment":
                return try decode(Appointment.self)
            case "AppointmentParticipant":
                return try decode(AppointmentParticipant.self)
            case "AppointmentResponse":
                return try decode(AppointmentResponse.self)
            case "Attachment":
                return try decode(Attachment.self)
            case "AuditEvent":
                return try decode(AuditEvent.self)
            case "AuditEventEvent":
                return try decode(AuditEventEvent.self)
            case "AuditEventObject":
                return try decode(AuditEventObject.self)
            case "AuditEventObjectDetail":
                return try decode(AuditEventObjectDetail.self)
            case "AuditEventParticipant":
                return try decode(AuditEventParticipant.self)
            case "AuditEventParticipantNetwork":
                return try decode(AuditEventParticipantNetwork.self)
            case "AuditEventSource":
                return try decode(AuditEventSource.self)
            case "BackboneElement":
                return try decode(BackboneElement.self)
            case "Basic":
                return try decode(Basic.self)
            case "Binary":
                return try decode(Binary.self)
            case "BodySite":
                return try decode(BodySite.self)
            case "Bundle":
                return try decode(Bundle.self)
            case "BundleEntry":
                return try decode(BundleEntry.self)
            case "BundleEntryRequest":
                return try decode(BundleEntryRequest.self)
            case "BundleEntryResponse":
                return try decode(BundleEntryResponse.self)
            case "BundleEntrySearch":
                return try decode(BundleEntrySearch.self)
            case "BundleLink":
                return try decode(BundleLink.self)
            case "CarePlan":
                return try decode(CarePlan.self)
            case "CarePlanActivity":
                return try decode(CarePlanActivity.self)
            case "CarePlanActivityDetail":
                return try decode(CarePlanActivityDetail.self)
            case "CarePlanParticipant":
                return try decode(CarePlanParticipant.self)
            case "CarePlanRelatedPlan":
                return try decode(CarePlanRelatedPlan.self)
            case "Claim":
                return try decode(Claim.self)
            case "ClaimCoverage":
                return try decode(ClaimCoverage.self)
            case "ClaimDiagnosis":
                return try decode(ClaimDiagnosis.self)
            case "ClaimItem":
                return try decode(ClaimItem.self)
            case "ClaimItemDetail":
                return try decode(ClaimItemDetail.self)
            case "ClaimItemDetailSubDetail":
                return try decode(ClaimItemDetailSubDetail.self)
            case "ClaimItemProsthesis":
                return try decode(ClaimItemProsthesis.self)
            case "ClaimMissingTeeth":
                return try decode(ClaimMissingTeeth.self)
            case "ClaimPayee":
                return try decode(ClaimPayee.self)
            case "ClaimResponse":
                return try decode(ClaimResponse.self)
            case "ClaimResponseAddItem":
                return try decode(ClaimResponseAddItem.self)
            case "ClaimResponseAddItemAdjudication":
                return try decode(ClaimResponseAddItemAdjudication.self)
            case "ClaimResponseAddItemDetail":
                return try decode(ClaimResponseAddItemDetail.self)
            case "ClaimResponseAddItemDetailAdjudication":
                return try decode(ClaimResponseAddItemDetailAdjudication.self)
            case "ClaimResponseCoverage":
                return try decode(ClaimResponseCoverage.self)
            case "ClaimResponseError":
                return try decode(ClaimResponseError.self)
            case "ClaimResponseItem":
                return try decode(ClaimResponseItem.self)
            case "ClaimResponseItemAdjudication":
                return try decode(ClaimResponseItemAdjudication.self)
            case "ClaimResponseItemDetail":
                return try decode(ClaimResponseItemDetail.self)
            case "ClaimResponseItemDetailAdjudication":
                return try decode(ClaimResponseItemDetailAdjudication.self)
            case "ClaimResponseItemDetailSubDetail":
                return try decode(ClaimResponseItemDetailSubDetail.self)
            case "ClaimResponseItemDetailSubDetailAdjudication":
                return try decode(ClaimResponseItemDetailSubDetailAdjudication.self)
            case "ClaimResponseNote":
                return try decode(ClaimResponseNote.self)
            case "ClinicalImpression":
                return try decode(ClinicalImpression.self)
            case "ClinicalImpressionFinding":
                return try decode(ClinicalImpressionFinding.self)
            case "ClinicalImpressionInvestigations":
                return try decode(ClinicalImpressionInvestigations.self)
            case "ClinicalImpressionRuledOut":
                return try decode(ClinicalImpressionRuledOut.self)
            case "CodeableConcept":
                return try decode(CodeableConcept.self)
            case "Coding":
                return try decode(Coding.self)
            case "Communication":
                return try decode(Communication.self)
            case "CommunicationPayload":
                return try decode(CommunicationPayload.self)
            case "CommunicationRequest":
                return try decode(CommunicationRequest.self)
            case "CommunicationRequestPayload":
                return try decode(CommunicationRequestPayload.self)
            case "Composition":
                return try decode(Composition.self)
            case "CompositionAttester":
                return try decode(CompositionAttester.self)
            case "CompositionEvent":
                return try decode(CompositionEvent.self)
            case "CompositionSection":
                return try decode(CompositionSection.self)
            case "ConceptMap":
                return try decode(ConceptMap.self)
            case "ConceptMapContact":
                return try decode(ConceptMapContact.self)
            case "ConceptMapElement":
                return try decode(ConceptMapElement.self)
            case "ConceptMapElementTarget":
                return try decode(ConceptMapElementTarget.self)
            case "ConceptMapElementTargetDependsOn":
                return try decode(ConceptMapElementTargetDependsOn.self)
            case "Condition":
                return try decode(Condition.self)
            case "ConditionEvidence":
                return try decode(ConditionEvidence.self)
            case "ConditionStage":
                return try decode(ConditionStage.self)
            case "Conformance":
                return try decode(Conformance.self)
            case "ConformanceContact":
                return try decode(ConformanceContact.self)
            case "ConformanceDocument":
                return try decode(ConformanceDocument.self)
            case "ConformanceImplementation":
                return try decode(ConformanceImplementation.self)
            case "ConformanceMessaging":
                return try decode(ConformanceMessaging.self)
            case "ConformanceMessagingEndpoint":
                return try decode(ConformanceMessagingEndpoint.self)
            case "ConformanceMessagingEvent":
                return try decode(ConformanceMessagingEvent.self)
            case "ConformanceRest":
                return try decode(ConformanceRest.self)
            case "ConformanceRestInteraction":
                return try decode(ConformanceRestInteraction.self)
            case "ConformanceRestOperation":
                return try decode(ConformanceRestOperation.self)
            case "ConformanceRestResource":
                return try decode(ConformanceRestResource.self)
            case "ConformanceRestResourceInteraction":
                return try decode(ConformanceRestResourceInteraction.self)
            case "ConformanceRestResourceSearchParam":
                return try decode(ConformanceRestResourceSearchParam.self)
            case "ConformanceRestSecurity":
                return try decode(ConformanceRestSecurity.self)
            case "ConformanceRestSecurityCertificate":
                return try decode(ConformanceRestSecurityCertificate.self)
            case "ConformanceSoftware":
                return try decode(ConformanceSoftware.self)
            case "ContactPoint":
                return try decode(ContactPoint.self)
            case "Contract":
                return try decode(Contract.self)
            case "ContractActor":
                return try decode(ContractActor.self)
            case "ContractFriendly":
                return try decode(ContractFriendly.self)
            case "ContractLegal":
                return try decode(ContractLegal.self)
            case "ContractRule":
                return try decode(ContractRule.self)
            case "ContractSigner":
                return try decode(ContractSigner.self)
            case "ContractTerm":
                return try decode(ContractTerm.self)
            case "ContractTermActor":
                return try decode(ContractTermActor.self)
            case "ContractTermValuedItem":
                return try decode(ContractTermValuedItem.self)
            case "ContractValuedItem":
                return try decode(ContractValuedItem.self)
            case "Count":
                return try decode(Count.self)
            case "Coverage":
                return try decode(Coverage.self)
            case "DataElement":
                return try decode(DataElement.self)
            case "DataElementContact":
                return try decode(DataElementContact.self)
            case "DataElementMapping":
                return try decode(DataElementMapping.self)
            case "DetectedIssue":
                return try decode(DetectedIssue.self)
            case "DetectedIssueMitigation":
                return try decode(DetectedIssueMitigation.self)
            case "Device":
                return try decode(Device.self)
            case "DeviceComponent":
                return try decode(DeviceComponent.self)
            case "DeviceComponentProductionSpecification":
                return try decode(DeviceComponentProductionSpecification.self)
            case "DeviceMetric":
                return try decode(DeviceMetric.self)
            case "DeviceMetricCalibration":
                return try decode(DeviceMetricCalibration.self)
            case "DeviceUseRequest":
                return try decode(DeviceUseRequest.self)
            case "DeviceUseStatement":
                return try decode(DeviceUseStatement.self)
            case "DiagnosticOrder":
                return try decode(DiagnosticOrder.self)
            case "DiagnosticOrderEvent":
                return try decode(DiagnosticOrderEvent.self)
            case "DiagnosticOrderItem":
                return try decode(DiagnosticOrderItem.self)
            case "DiagnosticReport":
                return try decode(DiagnosticReport.self)
            case "DiagnosticReportImage":
                return try decode(DiagnosticReportImage.self)
            case "Distance":
                return try decode(Distance.self)
            case "DocumentManifest":
                return try decode(DocumentManifest.self)
            case "DocumentManifestContent":
                return try decode(DocumentManifestContent.self)
            case "DocumentManifestRelated":
                return try decode(DocumentManifestRelated.self)
            case "DocumentReference":
                return try decode(DocumentReference.self)
            case "DocumentReferenceContent":
                return try decode(DocumentReferenceContent.self)
            case "DocumentReferenceContext":
                return try decode(DocumentReferenceContext.self)
            case "DocumentReferenceContextRelated":
                return try decode(DocumentReferenceContextRelated.self)
            case "DocumentReferenceRelatesTo":
                return try decode(DocumentReferenceRelatesTo.self)
            case "DomainResource":
                return try decode(DomainResource.self)
            case "Duration":
                return try decode(Duration.self)
            case "Element":
                return try decode(Element.self)
            case "ElementDefinition":
                return try decode(ElementDefinition.self)
            case "ElementDefinitionBase":
                return try decode(ElementDefinitionBase.self)
            case "ElementDefinitionBinding":
                return try decode(ElementDefinitionBinding.self)
            case "ElementDefinitionConstraint":
                return try decode(ElementDefinitionConstraint.self)
            case "ElementDefinitionMapping":
                return try decode(ElementDefinitionMapping.self)
            case "ElementDefinitionSlicing":
                return try decode(ElementDefinitionSlicing.self)
            case "ElementDefinitionType":
                return try decode(ElementDefinitionType.self)
            case "EligibilityRequest":
                return try decode(EligibilityRequest.self)
            case "EligibilityResponse":
                return try decode(EligibilityResponse.self)
            case "Encounter":
                return try decode(Encounter.self)
            case "EncounterHospitalization":
                return try decode(EncounterHospitalization.self)
            case "EncounterLocation":
                return try decode(EncounterLocation.self)
            case "EncounterParticipant":
                return try decode(EncounterParticipant.self)
            case "EncounterStatusHistory":
                return try decode(EncounterStatusHistory.self)
            case "EnrollmentRequest":
                return try decode(EnrollmentRequest.self)
            case "EnrollmentResponse":
                return try decode(EnrollmentResponse.self)
            case "EpisodeOfCare":
                return try decode(EpisodeOfCare.self)
            case "EpisodeOfCareCareTeam":
                return try decode(EpisodeOfCareCareTeam.self)
            case "EpisodeOfCareStatusHistory":
                return try decode(EpisodeOfCareStatusHistory.self)
            case "ExplanationOfBenefit":
                return try decode(ExplanationOfBenefit.self)
            case "Extension":
                return try decode(Extension.self)
            case "FamilyMemberHistory":
                return try decode(FamilyMemberHistory.self)
            case "FamilyMemberHistoryCondition":
                return try decode(FamilyMemberHistoryCondition.self)
            case "Flag":
                return try decode(Flag.self)
            case "Goal":
                return try decode(Goal.self)
            case "GoalOutcome":
                return try decode(GoalOutcome.self)
            case "Group":
                return try decode(Group.self)
            case "GroupCharacteristic":
                return try decode(GroupCharacteristic.self)
            case "GroupMember":
                return try decode(GroupMember.self)
            case "HealthcareService":
                return try decode(HealthcareService.self)
            case "HealthcareServiceAvailableTime":
                return try decode(HealthcareServiceAvailableTime.self)
            case "HealthcareServiceNotAvailable":
                return try decode(HealthcareServiceNotAvailable.self)
            case "HealthcareServiceServiceType":
                return try decode(HealthcareServiceServiceType.self)
            case "HumanName":
                return try decode(HumanName.self)
            case "Identifier":
                return try decode(Identifier.self)
            case "ImagingObjectSelection":
                return try decode(ImagingObjectSelection.self)
            case "ImagingObjectSelectionStudy":
                return try decode(ImagingObjectSelectionStudy.self)
            case "ImagingObjectSelectionStudySeries":
                return try decode(ImagingObjectSelectionStudySeries.self)
            case "ImagingObjectSelectionStudySeriesInstance":
                return try decode(ImagingObjectSelectionStudySeriesInstance.self)
            case "ImagingObjectSelectionStudySeriesInstanceFrames":
                return try decode(ImagingObjectSelectionStudySeriesInstanceFrames.self)
            case "ImagingStudy":
                return try decode(ImagingStudy.self)
            case "ImagingStudySeries":
                return try decode(ImagingStudySeries.self)
            case "ImagingStudySeriesInstance":
                return try decode(ImagingStudySeriesInstance.self)
            case "Immunization":
                return try decode(Immunization.self)
            case "ImmunizationExplanation":
                return try decode(ImmunizationExplanation.self)
            case "ImmunizationReaction":
                return try decode(ImmunizationReaction.self)
            case "ImmunizationRecommendation":
                return try decode(ImmunizationRecommendation.self)
            case "ImmunizationRecommendationRecommendation":
                return try decode(ImmunizationRecommendationRecommendation.self)
            case "ImmunizationRecommendationRecommendationDateCriterion":
                return try decode(ImmunizationRecommendationRecommendationDateCriterion.self)
            case "ImmunizationRecommendationRecommendationProtocol":
                return try decode(ImmunizationRecommendationRecommendationProtocol.self)
            case "ImmunizationVaccinationProtocol":
                return try decode(ImmunizationVaccinationProtocol.self)
            case "ImplementationGuide":
                return try decode(ImplementationGuide.self)
            case "ImplementationGuideContact":
                return try decode(ImplementationGuideContact.self)
            case "ImplementationGuideDependency":
                return try decode(ImplementationGuideDependency.self)
            case "ImplementationGuideGlobal":
                return try decode(ImplementationGuideGlobal.self)
            case "ImplementationGuidePackage":
                return try decode(ImplementationGuidePackage.self)
            case "ImplementationGuidePackageResource":
                return try decode(ImplementationGuidePackageResource.self)
            case "ImplementationGuidePage":
                return try decode(ImplementationGuidePage.self)
            case "List":
                return try decode(List.self)
            case "ListEntry":
                return try decode(ListEntry.self)
            case "Location":
                return try decode(Location.self)
            case "LocationPosition":
                return try decode(LocationPosition.self)
            case "Media":
                return try decode(Media.self)
            case "Medication":
                return try decode(Medication.self)
            case "MedicationAdministration":
                return try decode(MedicationAdministration.self)
            case "MedicationAdministrationDosage":
                return try decode(MedicationAdministrationDosage.self)
            case "MedicationDispense":
                return try decode(MedicationDispense.self)
            case "MedicationDispenseDosageInstruction":
                return try decode(MedicationDispenseDosageInstruction.self)
            case "MedicationDispenseSubstitution":
                return try decode(MedicationDispenseSubstitution.self)
            case "MedicationOrder":
                return try decode(MedicationOrder.self)
            case "MedicationOrderDispenseRequest":
                return try decode(MedicationOrderDispenseRequest.self)
            case "MedicationOrderDosageInstruction":
                return try decode(MedicationOrderDosageInstruction.self)
            case "MedicationOrderSubstitution":
                return try decode(MedicationOrderSubstitution.self)
            case "MedicationPackage":
                return try decode(MedicationPackage.self)
            case "MedicationPackageContent":
                return try decode(MedicationPackageContent.self)
            case "MedicationProduct":
                return try decode(MedicationProduct.self)
            case "MedicationProductBatch":
                return try decode(MedicationProductBatch.self)
            case "MedicationProductIngredient":
                return try decode(MedicationProductIngredient.self)
            case "MedicationStatement":
                return try decode(MedicationStatement.self)
            case "MedicationStatementDosage":
                return try decode(MedicationStatementDosage.self)
            case "MessageHeader":
                return try decode(MessageHeader.self)
            case "MessageHeaderDestination":
                return try decode(MessageHeaderDestination.self)
            case "MessageHeaderResponse":
                return try decode(MessageHeaderResponse.self)
            case "MessageHeaderSource":
                return try decode(MessageHeaderSource.self)
            case "Meta":
                return try decode(Meta.self)
            case "Money":
                return try decode(Money.self)
            case "NamingSystem":
                return try decode(NamingSystem.self)
            case "NamingSystemContact":
                return try decode(NamingSystemContact.self)
            case "NamingSystemUniqueId":
                return try decode(NamingSystemUniqueId.self)
            case "Narrative":
                return try decode(Narrative.self)
            case "NutritionOrder":
                return try decode(NutritionOrder.self)
            case "NutritionOrderEnteralFormula":
                return try decode(NutritionOrderEnteralFormula.self)
            case "NutritionOrderEnteralFormulaAdministration":
                return try decode(NutritionOrderEnteralFormulaAdministration.self)
            case "NutritionOrderOralDiet":
                return try decode(NutritionOrderOralDiet.self)
            case "NutritionOrderOralDietNutrient":
                return try decode(NutritionOrderOralDietNutrient.self)
            case "NutritionOrderOralDietTexture":
                return try decode(NutritionOrderOralDietTexture.self)
            case "NutritionOrderSupplement":
                return try decode(NutritionOrderSupplement.self)
            case "Observation":
                return try decode(Observation.self)
            case "ObservationComponent":
                return try decode(ObservationComponent.self)
            case "ObservationReferenceRange":
                return try decode(ObservationReferenceRange.self)
            case "ObservationRelated":
                return try decode(ObservationRelated.self)
            case "OperationDefinition":
                return try decode(OperationDefinition.self)
            case "OperationDefinitionContact":
                return try decode(OperationDefinitionContact.self)
            case "OperationDefinitionParameter":
                return try decode(OperationDefinitionParameter.self)
            case "OperationDefinitionParameterBinding":
                return try decode(OperationDefinitionParameterBinding.self)
            case "OperationOutcome":
                return try decode(OperationOutcome.self)
            case "OperationOutcomeIssue":
                return try decode(OperationOutcomeIssue.self)
            case "Order":
                return try decode(Order.self)
            case "OrderResponse":
                return try decode(OrderResponse.self)
            case "OrderWhen":
                return try decode(OrderWhen.self)
            case "Organization":
                return try decode(Organization.self)
            case "OrganizationContact":
                return try decode(OrganizationContact.self)
            case "Parameters":
                return try decode(Parameters.self)
            case "ParametersParameter":
                return try decode(ParametersParameter.self)
            case "Patient":
                return try decode(Patient.self)
            case "PatientAnimal":
                return try decode(PatientAnimal.self)
            case "PatientCommunication":
                return try decode(PatientCommunication.self)
            case "PatientContact":
                return try decode(PatientContact.self)
            case "PatientLink":
                return try decode(PatientLink.self)
            case "PaymentNotice":
                return try decode(PaymentNotice.self)
            case "PaymentReconciliation":
                return try decode(PaymentReconciliation.self)
            case "PaymentReconciliationDetail":
                return try decode(PaymentReconciliationDetail.self)
            case "PaymentReconciliationNote":
                return try decode(PaymentReconciliationNote.self)
            case "Period":
                return try decode(Period.self)
            case "Person":
                return try decode(Person.self)
            case "PersonLink":
                return try decode(PersonLink.self)
            case "Practitioner":
                return try decode(Practitioner.self)
            case "PractitionerPractitionerRole":
                return try decode(PractitionerPractitionerRole.self)
            case "PractitionerQualification":
                return try decode(PractitionerQualification.self)
            case "Procedure":
                return try decode(Procedure.self)
            case "ProcedureFocalDevice":
                return try decode(ProcedureFocalDevice.self)
            case "ProcedurePerformer":
                return try decode(ProcedurePerformer.self)
            case "ProcedureRequest":
                return try decode(ProcedureRequest.self)
            case "ProcessRequest":
                return try decode(ProcessRequest.self)
            case "ProcessRequestItem":
                return try decode(ProcessRequestItem.self)
            case "ProcessResponse":
                return try decode(ProcessResponse.self)
            case "ProcessResponseNotes":
                return try decode(ProcessResponseNotes.self)
            case "Provenance":
                return try decode(Provenance.self)
            case "ProvenanceAgent":
                return try decode(ProvenanceAgent.self)
            case "ProvenanceAgentRelatedAgent":
                return try decode(ProvenanceAgentRelatedAgent.self)
            case "ProvenanceEntity":
                return try decode(ProvenanceEntity.self)
            case "Quantity":
                return try decode(Quantity.self)
            case "Questionnaire":
                return try decode(Questionnaire.self)
            case "QuestionnaireGroup":
                return try decode(QuestionnaireGroup.self)
            case "QuestionnaireGroupQuestion":
                return try decode(QuestionnaireGroupQuestion.self)
            case "QuestionnaireResponse":
                return try decode(QuestionnaireResponse.self)
            case "QuestionnaireResponseGroup":
                return try decode(QuestionnaireResponseGroup.self)
            case "QuestionnaireResponseGroupQuestion":
                return try decode(QuestionnaireResponseGroupQuestion.self)
            case "QuestionnaireResponseGroupQuestionAnswer":
                return try decode(QuestionnaireResponseGroupQuestionAnswer.self)
            case "Range":
                return try decode(Range.self)
            case "Ratio":
                return try decode(Ratio.self)
            case "Reference":
                return try decode(Reference.self)
            case "ReferralRequest":
                return try decode(ReferralRequest.self)
            case "RelatedPerson":
                return try decode(RelatedPerson.self)
            case "Resource":
                return try decode(Resource.self)
            case "RiskAssessment":
                return try decode(RiskAssessment.self)
            case "RiskAssessmentPrediction":
                return try decode(RiskAssessmentPrediction.self)
            case "SampledData":
                return try decode(SampledData.self)
            case "Schedule":
                return try decode(Schedule.self)
            case "SearchParameter":
                return try decode(SearchParameter.self)
            case "SearchParameterContact":
                return try decode(SearchParameterContact.self)
            case "Signature":
                return try decode(Signature.self)
            case "Slot":
                return try decode(Slot.self)
            case "Specimen":
                return try decode(Specimen.self)
            case "SpecimenCollection":
                return try decode(SpecimenCollection.self)
            case "SpecimenContainer":
                return try decode(SpecimenContainer.self)
            case "SpecimenTreatment":
                return try decode(SpecimenTreatment.self)
            case "StructureDefinition":
                return try decode(StructureDefinition.self)
            case "StructureDefinitionContact":
                return try decode(StructureDefinitionContact.self)
            case "StructureDefinitionDifferential":
                return try decode(StructureDefinitionDifferential.self)
            case "StructureDefinitionMapping":
                return try decode(StructureDefinitionMapping.self)
            case "StructureDefinitionSnapshot":
                return try decode(StructureDefinitionSnapshot.self)
            case "Subscription":
                return try decode(Subscription.self)
            case "SubscriptionChannel":
                return try decode(SubscriptionChannel.self)
            case "Substance":
                return try decode(Substance.self)
            case "SubstanceIngredient":
                return try decode(SubstanceIngredient.self)
            case "SubstanceInstance":
                return try decode(SubstanceInstance.self)
            case "SupplyDelivery":
                return try decode(SupplyDelivery.self)
            case "SupplyRequest":
                return try decode(SupplyRequest.self)
            case "SupplyRequestWhen":
                return try decode(SupplyRequestWhen.self)
            case "TestScript":
                return try decode(TestScript.self)
            case "TestScriptContact":
                return try decode(TestScriptContact.self)
            case "TestScriptFixture":
                return try decode(TestScriptFixture.self)
            case "TestScriptMetadata":
                return try decode(TestScriptMetadata.self)
            case "TestScriptMetadataCapability":
                return try decode(TestScriptMetadataCapability.self)
            case "TestScriptMetadataLink":
                return try decode(TestScriptMetadataLink.self)
            case "TestScriptSetup":
                return try decode(TestScriptSetup.self)
            case "TestScriptSetupAction":
                return try decode(TestScriptSetupAction.self)
            case "TestScriptSetupActionAssert":
                return try decode(TestScriptSetupActionAssert.self)
            case "TestScriptSetupActionOperation":
                return try decode(TestScriptSetupActionOperation.self)
            case "TestScriptSetupActionOperationRequestHeader":
                return try decode(TestScriptSetupActionOperationRequestHeader.self)
            case "TestScriptTeardown":
                return try decode(TestScriptTeardown.self)
            case "TestScriptTeardownAction":
                return try decode(TestScriptTeardownAction.self)
            case "TestScriptTest":
                return try decode(TestScriptTest.self)
            case "TestScriptTestAction":
                return try decode(TestScriptTestAction.self)
            case "TestScriptVariable":
                return try decode(TestScriptVariable.self)
            case "Timing":
                return try decode(Timing.self)
            case "TimingRepeat":
                return try decode(TimingRepeat.self)
            case "ValueSet":
                return try decode(ValueSet.self)
            case "ValueSetCodeSystem":
                return try decode(ValueSetCodeSystem.self)
            case "ValueSetCodeSystemConcept":
                return try decode(ValueSetCodeSystemConcept.self)
            case "ValueSetCodeSystemConceptDesignation":
                return try decode(ValueSetCodeSystemConceptDesignation.self)
            case "ValueSetCompose":
                return try decode(ValueSetCompose.self)
            case "ValueSetComposeInclude":
                return try decode(ValueSetComposeInclude.self)
            case "ValueSetComposeIncludeConcept":
                return try decode(ValueSetComposeIncludeConcept.self)
            case "ValueSetComposeIncludeFilter":
                return try decode(ValueSetComposeIncludeFilter.self)
            case "ValueSetContact":
                return try decode(ValueSetContact.self)
            case "ValueSetExpansion":
                return try decode(ValueSetExpansion.self)
            case "ValueSetExpansionContains":
                return try decode(ValueSetExpansionContains.self)
            case "ValueSetExpansionParameter":
                return try decode(ValueSetExpansionParameter.self)
            case "VisionPrescription":
                return try decode(VisionPrescription.self)
            case "VisionPrescriptionDispense":
                return try decode(VisionPrescriptionDispense.self)
            default:
                throw UnknownFhirDecodingTypeError(className: className)
        }
    }
}

extension JSONDecoder {
    func decode(_ resourceClassName: String, from data: Data) throws -> FHIRAbstractBase {
        switch resourceClassName {
            case "Account":
                return try decode(Account.self, from: data)
            case "Address":
                return try decode(Address.self, from: data)
            case "Age":
                return try decode(Age.self, from: data)
            case "AllergyIntolerance":
                return try decode(AllergyIntolerance.self, from: data)
            case "AllergyIntoleranceReaction":
                return try decode(AllergyIntoleranceReaction.self, from: data)
            case "Annotation":
                return try decode(Annotation.self, from: data)
            case "Appointment":
                return try decode(Appointment.self, from: data)
            case "AppointmentParticipant":
                return try decode(AppointmentParticipant.self, from: data)
            case "AppointmentResponse":
                return try decode(AppointmentResponse.self, from: data)
            case "Attachment":
                return try decode(Attachment.self, from: data)
            case "AuditEvent":
                return try decode(AuditEvent.self, from: data)
            case "AuditEventEvent":
                return try decode(AuditEventEvent.self, from: data)
            case "AuditEventObject":
                return try decode(AuditEventObject.self, from: data)
            case "AuditEventObjectDetail":
                return try decode(AuditEventObjectDetail.self, from: data)
            case "AuditEventParticipant":
                return try decode(AuditEventParticipant.self, from: data)
            case "AuditEventParticipantNetwork":
                return try decode(AuditEventParticipantNetwork.self, from: data)
            case "AuditEventSource":
                return try decode(AuditEventSource.self, from: data)
            case "BackboneElement":
                return try decode(BackboneElement.self, from: data)
            case "Basic":
                return try decode(Basic.self, from: data)
            case "Binary":
                return try decode(Binary.self, from: data)
            case "BodySite":
                return try decode(BodySite.self, from: data)
            case "Bundle":
                return try decode(Bundle.self, from: data)
            case "BundleEntry":
                return try decode(BundleEntry.self, from: data)
            case "BundleEntryRequest":
                return try decode(BundleEntryRequest.self, from: data)
            case "BundleEntryResponse":
                return try decode(BundleEntryResponse.self, from: data)
            case "BundleEntrySearch":
                return try decode(BundleEntrySearch.self, from: data)
            case "BundleLink":
                return try decode(BundleLink.self, from: data)
            case "CarePlan":
                return try decode(CarePlan.self, from: data)
            case "CarePlanActivity":
                return try decode(CarePlanActivity.self, from: data)
            case "CarePlanActivityDetail":
                return try decode(CarePlanActivityDetail.self, from: data)
            case "CarePlanParticipant":
                return try decode(CarePlanParticipant.self, from: data)
            case "CarePlanRelatedPlan":
                return try decode(CarePlanRelatedPlan.self, from: data)
            case "Claim":
                return try decode(Claim.self, from: data)
            case "ClaimCoverage":
                return try decode(ClaimCoverage.self, from: data)
            case "ClaimDiagnosis":
                return try decode(ClaimDiagnosis.self, from: data)
            case "ClaimItem":
                return try decode(ClaimItem.self, from: data)
            case "ClaimItemDetail":
                return try decode(ClaimItemDetail.self, from: data)
            case "ClaimItemDetailSubDetail":
                return try decode(ClaimItemDetailSubDetail.self, from: data)
            case "ClaimItemProsthesis":
                return try decode(ClaimItemProsthesis.self, from: data)
            case "ClaimMissingTeeth":
                return try decode(ClaimMissingTeeth.self, from: data)
            case "ClaimPayee":
                return try decode(ClaimPayee.self, from: data)
            case "ClaimResponse":
                return try decode(ClaimResponse.self, from: data)
            case "ClaimResponseAddItem":
                return try decode(ClaimResponseAddItem.self, from: data)
            case "ClaimResponseAddItemAdjudication":
                return try decode(ClaimResponseAddItemAdjudication.self, from: data)
            case "ClaimResponseAddItemDetail":
                return try decode(ClaimResponseAddItemDetail.self, from: data)
            case "ClaimResponseAddItemDetailAdjudication":
                return try decode(ClaimResponseAddItemDetailAdjudication.self, from: data)
            case "ClaimResponseCoverage":
                return try decode(ClaimResponseCoverage.self, from: data)
            case "ClaimResponseError":
                return try decode(ClaimResponseError.self, from: data)
            case "ClaimResponseItem":
                return try decode(ClaimResponseItem.self, from: data)
            case "ClaimResponseItemAdjudication":
                return try decode(ClaimResponseItemAdjudication.self, from: data)
            case "ClaimResponseItemDetail":
                return try decode(ClaimResponseItemDetail.self, from: data)
            case "ClaimResponseItemDetailAdjudication":
                return try decode(ClaimResponseItemDetailAdjudication.self, from: data)
            case "ClaimResponseItemDetailSubDetail":
                return try decode(ClaimResponseItemDetailSubDetail.self, from: data)
            case "ClaimResponseItemDetailSubDetailAdjudication":
                return try decode(ClaimResponseItemDetailSubDetailAdjudication.self, from: data)
            case "ClaimResponseNote":
                return try decode(ClaimResponseNote.self, from: data)
            case "ClinicalImpression":
                return try decode(ClinicalImpression.self, from: data)
            case "ClinicalImpressionFinding":
                return try decode(ClinicalImpressionFinding.self, from: data)
            case "ClinicalImpressionInvestigations":
                return try decode(ClinicalImpressionInvestigations.self, from: data)
            case "ClinicalImpressionRuledOut":
                return try decode(ClinicalImpressionRuledOut.self, from: data)
            case "CodeableConcept":
                return try decode(CodeableConcept.self, from: data)
            case "Coding":
                return try decode(Coding.self, from: data)
            case "Communication":
                return try decode(Communication.self, from: data)
            case "CommunicationPayload":
                return try decode(CommunicationPayload.self, from: data)
            case "CommunicationRequest":
                return try decode(CommunicationRequest.self, from: data)
            case "CommunicationRequestPayload":
                return try decode(CommunicationRequestPayload.self, from: data)
            case "Composition":
                return try decode(Composition.self, from: data)
            case "CompositionAttester":
                return try decode(CompositionAttester.self, from: data)
            case "CompositionEvent":
                return try decode(CompositionEvent.self, from: data)
            case "CompositionSection":
                return try decode(CompositionSection.self, from: data)
            case "ConceptMap":
                return try decode(ConceptMap.self, from: data)
            case "ConceptMapContact":
                return try decode(ConceptMapContact.self, from: data)
            case "ConceptMapElement":
                return try decode(ConceptMapElement.self, from: data)
            case "ConceptMapElementTarget":
                return try decode(ConceptMapElementTarget.self, from: data)
            case "ConceptMapElementTargetDependsOn":
                return try decode(ConceptMapElementTargetDependsOn.self, from: data)
            case "Condition":
                return try decode(Condition.self, from: data)
            case "ConditionEvidence":
                return try decode(ConditionEvidence.self, from: data)
            case "ConditionStage":
                return try decode(ConditionStage.self, from: data)
            case "Conformance":
                return try decode(Conformance.self, from: data)
            case "ConformanceContact":
                return try decode(ConformanceContact.self, from: data)
            case "ConformanceDocument":
                return try decode(ConformanceDocument.self, from: data)
            case "ConformanceImplementation":
                return try decode(ConformanceImplementation.self, from: data)
            case "ConformanceMessaging":
                return try decode(ConformanceMessaging.self, from: data)
            case "ConformanceMessagingEndpoint":
                return try decode(ConformanceMessagingEndpoint.self, from: data)
            case "ConformanceMessagingEvent":
                return try decode(ConformanceMessagingEvent.self, from: data)
            case "ConformanceRest":
                return try decode(ConformanceRest.self, from: data)
            case "ConformanceRestInteraction":
                return try decode(ConformanceRestInteraction.self, from: data)
            case "ConformanceRestOperation":
                return try decode(ConformanceRestOperation.self, from: data)
            case "ConformanceRestResource":
                return try decode(ConformanceRestResource.self, from: data)
            case "ConformanceRestResourceInteraction":
                return try decode(ConformanceRestResourceInteraction.self, from: data)
            case "ConformanceRestResourceSearchParam":
                return try decode(ConformanceRestResourceSearchParam.self, from: data)
            case "ConformanceRestSecurity":
                return try decode(ConformanceRestSecurity.self, from: data)
            case "ConformanceRestSecurityCertificate":
                return try decode(ConformanceRestSecurityCertificate.self, from: data)
            case "ConformanceSoftware":
                return try decode(ConformanceSoftware.self, from: data)
            case "ContactPoint":
                return try decode(ContactPoint.self, from: data)
            case "Contract":
                return try decode(Contract.self, from: data)
            case "ContractActor":
                return try decode(ContractActor.self, from: data)
            case "ContractFriendly":
                return try decode(ContractFriendly.self, from: data)
            case "ContractLegal":
                return try decode(ContractLegal.self, from: data)
            case "ContractRule":
                return try decode(ContractRule.self, from: data)
            case "ContractSigner":
                return try decode(ContractSigner.self, from: data)
            case "ContractTerm":
                return try decode(ContractTerm.self, from: data)
            case "ContractTermActor":
                return try decode(ContractTermActor.self, from: data)
            case "ContractTermValuedItem":
                return try decode(ContractTermValuedItem.self, from: data)
            case "ContractValuedItem":
                return try decode(ContractValuedItem.self, from: data)
            case "Count":
                return try decode(Count.self, from: data)
            case "Coverage":
                return try decode(Coverage.self, from: data)
            case "DataElement":
                return try decode(DataElement.self, from: data)
            case "DataElementContact":
                return try decode(DataElementContact.self, from: data)
            case "DataElementMapping":
                return try decode(DataElementMapping.self, from: data)
            case "DetectedIssue":
                return try decode(DetectedIssue.self, from: data)
            case "DetectedIssueMitigation":
                return try decode(DetectedIssueMitigation.self, from: data)
            case "Device":
                return try decode(Device.self, from: data)
            case "DeviceComponent":
                return try decode(DeviceComponent.self, from: data)
            case "DeviceComponentProductionSpecification":
                return try decode(DeviceComponentProductionSpecification.self, from: data)
            case "DeviceMetric":
                return try decode(DeviceMetric.self, from: data)
            case "DeviceMetricCalibration":
                return try decode(DeviceMetricCalibration.self, from: data)
            case "DeviceUseRequest":
                return try decode(DeviceUseRequest.self, from: data)
            case "DeviceUseStatement":
                return try decode(DeviceUseStatement.self, from: data)
            case "DiagnosticOrder":
                return try decode(DiagnosticOrder.self, from: data)
            case "DiagnosticOrderEvent":
                return try decode(DiagnosticOrderEvent.self, from: data)
            case "DiagnosticOrderItem":
                return try decode(DiagnosticOrderItem.self, from: data)
            case "DiagnosticReport":
                return try decode(DiagnosticReport.self, from: data)
            case "DiagnosticReportImage":
                return try decode(DiagnosticReportImage.self, from: data)
            case "Distance":
                return try decode(Distance.self, from: data)
            case "DocumentManifest":
                return try decode(DocumentManifest.self, from: data)
            case "DocumentManifestContent":
                return try decode(DocumentManifestContent.self, from: data)
            case "DocumentManifestRelated":
                return try decode(DocumentManifestRelated.self, from: data)
            case "DocumentReference":
                return try decode(DocumentReference.self, from: data)
            case "DocumentReferenceContent":
                return try decode(DocumentReferenceContent.self, from: data)
            case "DocumentReferenceContext":
                return try decode(DocumentReferenceContext.self, from: data)
            case "DocumentReferenceContextRelated":
                return try decode(DocumentReferenceContextRelated.self, from: data)
            case "DocumentReferenceRelatesTo":
                return try decode(DocumentReferenceRelatesTo.self, from: data)
            case "DomainResource":
                return try decode(DomainResource.self, from: data)
            case "Duration":
                return try decode(Duration.self, from: data)
            case "Element":
                return try decode(Element.self, from: data)
            case "ElementDefinition":
                return try decode(ElementDefinition.self, from: data)
            case "ElementDefinitionBase":
                return try decode(ElementDefinitionBase.self, from: data)
            case "ElementDefinitionBinding":
                return try decode(ElementDefinitionBinding.self, from: data)
            case "ElementDefinitionConstraint":
                return try decode(ElementDefinitionConstraint.self, from: data)
            case "ElementDefinitionMapping":
                return try decode(ElementDefinitionMapping.self, from: data)
            case "ElementDefinitionSlicing":
                return try decode(ElementDefinitionSlicing.self, from: data)
            case "ElementDefinitionType":
                return try decode(ElementDefinitionType.self, from: data)
            case "EligibilityRequest":
                return try decode(EligibilityRequest.self, from: data)
            case "EligibilityResponse":
                return try decode(EligibilityResponse.self, from: data)
            case "Encounter":
                return try decode(Encounter.self, from: data)
            case "EncounterHospitalization":
                return try decode(EncounterHospitalization.self, from: data)
            case "EncounterLocation":
                return try decode(EncounterLocation.self, from: data)
            case "EncounterParticipant":
                return try decode(EncounterParticipant.self, from: data)
            case "EncounterStatusHistory":
                return try decode(EncounterStatusHistory.self, from: data)
            case "EnrollmentRequest":
                return try decode(EnrollmentRequest.self, from: data)
            case "EnrollmentResponse":
                return try decode(EnrollmentResponse.self, from: data)
            case "EpisodeOfCare":
                return try decode(EpisodeOfCare.self, from: data)
            case "EpisodeOfCareCareTeam":
                return try decode(EpisodeOfCareCareTeam.self, from: data)
            case "EpisodeOfCareStatusHistory":
                return try decode(EpisodeOfCareStatusHistory.self, from: data)
            case "ExplanationOfBenefit":
                return try decode(ExplanationOfBenefit.self, from: data)
            case "Extension":
                return try decode(Extension.self, from: data)
            case "FamilyMemberHistory":
                return try decode(FamilyMemberHistory.self, from: data)
            case "FamilyMemberHistoryCondition":
                return try decode(FamilyMemberHistoryCondition.self, from: data)
            case "Flag":
                return try decode(Flag.self, from: data)
            case "Goal":
                return try decode(Goal.self, from: data)
            case "GoalOutcome":
                return try decode(GoalOutcome.self, from: data)
            case "Group":
                return try decode(Group.self, from: data)
            case "GroupCharacteristic":
                return try decode(GroupCharacteristic.self, from: data)
            case "GroupMember":
                return try decode(GroupMember.self, from: data)
            case "HealthcareService":
                return try decode(HealthcareService.self, from: data)
            case "HealthcareServiceAvailableTime":
                return try decode(HealthcareServiceAvailableTime.self, from: data)
            case "HealthcareServiceNotAvailable":
                return try decode(HealthcareServiceNotAvailable.self, from: data)
            case "HealthcareServiceServiceType":
                return try decode(HealthcareServiceServiceType.self, from: data)
            case "HumanName":
                return try decode(HumanName.self, from: data)
            case "Identifier":
                return try decode(Identifier.self, from: data)
            case "ImagingObjectSelection":
                return try decode(ImagingObjectSelection.self, from: data)
            case "ImagingObjectSelectionStudy":
                return try decode(ImagingObjectSelectionStudy.self, from: data)
            case "ImagingObjectSelectionStudySeries":
                return try decode(ImagingObjectSelectionStudySeries.self, from: data)
            case "ImagingObjectSelectionStudySeriesInstance":
                return try decode(ImagingObjectSelectionStudySeriesInstance.self, from: data)
            case "ImagingObjectSelectionStudySeriesInstanceFrames":
                return try decode(ImagingObjectSelectionStudySeriesInstanceFrames.self, from: data)
            case "ImagingStudy":
                return try decode(ImagingStudy.self, from: data)
            case "ImagingStudySeries":
                return try decode(ImagingStudySeries.self, from: data)
            case "ImagingStudySeriesInstance":
                return try decode(ImagingStudySeriesInstance.self, from: data)
            case "Immunization":
                return try decode(Immunization.self, from: data)
            case "ImmunizationExplanation":
                return try decode(ImmunizationExplanation.self, from: data)
            case "ImmunizationReaction":
                return try decode(ImmunizationReaction.self, from: data)
            case "ImmunizationRecommendation":
                return try decode(ImmunizationRecommendation.self, from: data)
            case "ImmunizationRecommendationRecommendation":
                return try decode(ImmunizationRecommendationRecommendation.self, from: data)
            case "ImmunizationRecommendationRecommendationDateCriterion":
                return try decode(ImmunizationRecommendationRecommendationDateCriterion.self, from: data)
            case "ImmunizationRecommendationRecommendationProtocol":
                return try decode(ImmunizationRecommendationRecommendationProtocol.self, from: data)
            case "ImmunizationVaccinationProtocol":
                return try decode(ImmunizationVaccinationProtocol.self, from: data)
            case "ImplementationGuide":
                return try decode(ImplementationGuide.self, from: data)
            case "ImplementationGuideContact":
                return try decode(ImplementationGuideContact.self, from: data)
            case "ImplementationGuideDependency":
                return try decode(ImplementationGuideDependency.self, from: data)
            case "ImplementationGuideGlobal":
                return try decode(ImplementationGuideGlobal.self, from: data)
            case "ImplementationGuidePackage":
                return try decode(ImplementationGuidePackage.self, from: data)
            case "ImplementationGuidePackageResource":
                return try decode(ImplementationGuidePackageResource.self, from: data)
            case "ImplementationGuidePage":
                return try decode(ImplementationGuidePage.self, from: data)
            case "List":
                return try decode(List.self, from: data)
            case "ListEntry":
                return try decode(ListEntry.self, from: data)
            case "Location":
                return try decode(Location.self, from: data)
            case "LocationPosition":
                return try decode(LocationPosition.self, from: data)
            case "Media":
                return try decode(Media.self, from: data)
            case "Medication":
                return try decode(Medication.self, from: data)
            case "MedicationAdministration":
                return try decode(MedicationAdministration.self, from: data)
            case "MedicationAdministrationDosage":
                return try decode(MedicationAdministrationDosage.self, from: data)
            case "MedicationDispense":
                return try decode(MedicationDispense.self, from: data)
            case "MedicationDispenseDosageInstruction":
                return try decode(MedicationDispenseDosageInstruction.self, from: data)
            case "MedicationDispenseSubstitution":
                return try decode(MedicationDispenseSubstitution.self, from: data)
            case "MedicationOrder":
                return try decode(MedicationOrder.self, from: data)
            case "MedicationOrderDispenseRequest":
                return try decode(MedicationOrderDispenseRequest.self, from: data)
            case "MedicationOrderDosageInstruction":
                return try decode(MedicationOrderDosageInstruction.self, from: data)
            case "MedicationOrderSubstitution":
                return try decode(MedicationOrderSubstitution.self, from: data)
            case "MedicationPackage":
                return try decode(MedicationPackage.self, from: data)
            case "MedicationPackageContent":
                return try decode(MedicationPackageContent.self, from: data)
            case "MedicationProduct":
                return try decode(MedicationProduct.self, from: data)
            case "MedicationProductBatch":
                return try decode(MedicationProductBatch.self, from: data)
            case "MedicationProductIngredient":
                return try decode(MedicationProductIngredient.self, from: data)
            case "MedicationStatement":
                return try decode(MedicationStatement.self, from: data)
            case "MedicationStatementDosage":
                return try decode(MedicationStatementDosage.self, from: data)
            case "MessageHeader":
                return try decode(MessageHeader.self, from: data)
            case "MessageHeaderDestination":
                return try decode(MessageHeaderDestination.self, from: data)
            case "MessageHeaderResponse":
                return try decode(MessageHeaderResponse.self, from: data)
            case "MessageHeaderSource":
                return try decode(MessageHeaderSource.self, from: data)
            case "Meta":
                return try decode(Meta.self, from: data)
            case "Money":
                return try decode(Money.self, from: data)
            case "NamingSystem":
                return try decode(NamingSystem.self, from: data)
            case "NamingSystemContact":
                return try decode(NamingSystemContact.self, from: data)
            case "NamingSystemUniqueId":
                return try decode(NamingSystemUniqueId.self, from: data)
            case "Narrative":
                return try decode(Narrative.self, from: data)
            case "NutritionOrder":
                return try decode(NutritionOrder.self, from: data)
            case "NutritionOrderEnteralFormula":
                return try decode(NutritionOrderEnteralFormula.self, from: data)
            case "NutritionOrderEnteralFormulaAdministration":
                return try decode(NutritionOrderEnteralFormulaAdministration.self, from: data)
            case "NutritionOrderOralDiet":
                return try decode(NutritionOrderOralDiet.self, from: data)
            case "NutritionOrderOralDietNutrient":
                return try decode(NutritionOrderOralDietNutrient.self, from: data)
            case "NutritionOrderOralDietTexture":
                return try decode(NutritionOrderOralDietTexture.self, from: data)
            case "NutritionOrderSupplement":
                return try decode(NutritionOrderSupplement.self, from: data)
            case "Observation":
                return try decode(Observation.self, from: data)
            case "ObservationComponent":
                return try decode(ObservationComponent.self, from: data)
            case "ObservationReferenceRange":
                return try decode(ObservationReferenceRange.self, from: data)
            case "ObservationRelated":
                return try decode(ObservationRelated.self, from: data)
            case "OperationDefinition":
                return try decode(OperationDefinition.self, from: data)
            case "OperationDefinitionContact":
                return try decode(OperationDefinitionContact.self, from: data)
            case "OperationDefinitionParameter":
                return try decode(OperationDefinitionParameter.self, from: data)
            case "OperationDefinitionParameterBinding":
                return try decode(OperationDefinitionParameterBinding.self, from: data)
            case "OperationOutcome":
                return try decode(OperationOutcome.self, from: data)
            case "OperationOutcomeIssue":
                return try decode(OperationOutcomeIssue.self, from: data)
            case "Order":
                return try decode(Order.self, from: data)
            case "OrderResponse":
                return try decode(OrderResponse.self, from: data)
            case "OrderWhen":
                return try decode(OrderWhen.self, from: data)
            case "Organization":
                return try decode(Organization.self, from: data)
            case "OrganizationContact":
                return try decode(OrganizationContact.self, from: data)
            case "Parameters":
                return try decode(Parameters.self, from: data)
            case "ParametersParameter":
                return try decode(ParametersParameter.self, from: data)
            case "Patient":
                return try decode(Patient.self, from: data)
            case "PatientAnimal":
                return try decode(PatientAnimal.self, from: data)
            case "PatientCommunication":
                return try decode(PatientCommunication.self, from: data)
            case "PatientContact":
                return try decode(PatientContact.self, from: data)
            case "PatientLink":
                return try decode(PatientLink.self, from: data)
            case "PaymentNotice":
                return try decode(PaymentNotice.self, from: data)
            case "PaymentReconciliation":
                return try decode(PaymentReconciliation.self, from: data)
            case "PaymentReconciliationDetail":
                return try decode(PaymentReconciliationDetail.self, from: data)
            case "PaymentReconciliationNote":
                return try decode(PaymentReconciliationNote.self, from: data)
            case "Period":
                return try decode(Period.self, from: data)
            case "Person":
                return try decode(Person.self, from: data)
            case "PersonLink":
                return try decode(PersonLink.self, from: data)
            case "Practitioner":
                return try decode(Practitioner.self, from: data)
            case "PractitionerPractitionerRole":
                return try decode(PractitionerPractitionerRole.self, from: data)
            case "PractitionerQualification":
                return try decode(PractitionerQualification.self, from: data)
            case "Procedure":
                return try decode(Procedure.self, from: data)
            case "ProcedureFocalDevice":
                return try decode(ProcedureFocalDevice.self, from: data)
            case "ProcedurePerformer":
                return try decode(ProcedurePerformer.self, from: data)
            case "ProcedureRequest":
                return try decode(ProcedureRequest.self, from: data)
            case "ProcessRequest":
                return try decode(ProcessRequest.self, from: data)
            case "ProcessRequestItem":
                return try decode(ProcessRequestItem.self, from: data)
            case "ProcessResponse":
                return try decode(ProcessResponse.self, from: data)
            case "ProcessResponseNotes":
                return try decode(ProcessResponseNotes.self, from: data)
            case "Provenance":
                return try decode(Provenance.self, from: data)
            case "ProvenanceAgent":
                return try decode(ProvenanceAgent.self, from: data)
            case "ProvenanceAgentRelatedAgent":
                return try decode(ProvenanceAgentRelatedAgent.self, from: data)
            case "ProvenanceEntity":
                return try decode(ProvenanceEntity.self, from: data)
            case "Quantity":
                return try decode(Quantity.self, from: data)
            case "Questionnaire":
                return try decode(Questionnaire.self, from: data)
            case "QuestionnaireGroup":
                return try decode(QuestionnaireGroup.self, from: data)
            case "QuestionnaireGroupQuestion":
                return try decode(QuestionnaireGroupQuestion.self, from: data)
            case "QuestionnaireResponse":
                return try decode(QuestionnaireResponse.self, from: data)
            case "QuestionnaireResponseGroup":
                return try decode(QuestionnaireResponseGroup.self, from: data)
            case "QuestionnaireResponseGroupQuestion":
                return try decode(QuestionnaireResponseGroupQuestion.self, from: data)
            case "QuestionnaireResponseGroupQuestionAnswer":
                return try decode(QuestionnaireResponseGroupQuestionAnswer.self, from: data)
            case "Range":
                return try decode(Range.self, from: data)
            case "Ratio":
                return try decode(Ratio.self, from: data)
            case "Reference":
                return try decode(Reference.self, from: data)
            case "ReferralRequest":
                return try decode(ReferralRequest.self, from: data)
            case "RelatedPerson":
                return try decode(RelatedPerson.self, from: data)
            case "Resource":
                return try decode(Resource.self, from: data)
            case "RiskAssessment":
                return try decode(RiskAssessment.self, from: data)
            case "RiskAssessmentPrediction":
                return try decode(RiskAssessmentPrediction.self, from: data)
            case "SampledData":
                return try decode(SampledData.self, from: data)
            case "Schedule":
                return try decode(Schedule.self, from: data)
            case "SearchParameter":
                return try decode(SearchParameter.self, from: data)
            case "SearchParameterContact":
                return try decode(SearchParameterContact.self, from: data)
            case "Signature":
                return try decode(Signature.self, from: data)
            case "Slot":
                return try decode(Slot.self, from: data)
            case "Specimen":
                return try decode(Specimen.self, from: data)
            case "SpecimenCollection":
                return try decode(SpecimenCollection.self, from: data)
            case "SpecimenContainer":
                return try decode(SpecimenContainer.self, from: data)
            case "SpecimenTreatment":
                return try decode(SpecimenTreatment.self, from: data)
            case "StructureDefinition":
                return try decode(StructureDefinition.self, from: data)
            case "StructureDefinitionContact":
                return try decode(StructureDefinitionContact.self, from: data)
            case "StructureDefinitionDifferential":
                return try decode(StructureDefinitionDifferential.self, from: data)
            case "StructureDefinitionMapping":
                return try decode(StructureDefinitionMapping.self, from: data)
            case "StructureDefinitionSnapshot":
                return try decode(StructureDefinitionSnapshot.self, from: data)
            case "Subscription":
                return try decode(Subscription.self, from: data)
            case "SubscriptionChannel":
                return try decode(SubscriptionChannel.self, from: data)
            case "Substance":
                return try decode(Substance.self, from: data)
            case "SubstanceIngredient":
                return try decode(SubstanceIngredient.self, from: data)
            case "SubstanceInstance":
                return try decode(SubstanceInstance.self, from: data)
            case "SupplyDelivery":
                return try decode(SupplyDelivery.self, from: data)
            case "SupplyRequest":
                return try decode(SupplyRequest.self, from: data)
            case "SupplyRequestWhen":
                return try decode(SupplyRequestWhen.self, from: data)
            case "TestScript":
                return try decode(TestScript.self, from: data)
            case "TestScriptContact":
                return try decode(TestScriptContact.self, from: data)
            case "TestScriptFixture":
                return try decode(TestScriptFixture.self, from: data)
            case "TestScriptMetadata":
                return try decode(TestScriptMetadata.self, from: data)
            case "TestScriptMetadataCapability":
                return try decode(TestScriptMetadataCapability.self, from: data)
            case "TestScriptMetadataLink":
                return try decode(TestScriptMetadataLink.self, from: data)
            case "TestScriptSetup":
                return try decode(TestScriptSetup.self, from: data)
            case "TestScriptSetupAction":
                return try decode(TestScriptSetupAction.self, from: data)
            case "TestScriptSetupActionAssert":
                return try decode(TestScriptSetupActionAssert.self, from: data)
            case "TestScriptSetupActionOperation":
                return try decode(TestScriptSetupActionOperation.self, from: data)
            case "TestScriptSetupActionOperationRequestHeader":
                return try decode(TestScriptSetupActionOperationRequestHeader.self, from: data)
            case "TestScriptTeardown":
                return try decode(TestScriptTeardown.self, from: data)
            case "TestScriptTeardownAction":
                return try decode(TestScriptTeardownAction.self, from: data)
            case "TestScriptTest":
                return try decode(TestScriptTest.self, from: data)
            case "TestScriptTestAction":
                return try decode(TestScriptTestAction.self, from: data)
            case "TestScriptVariable":
                return try decode(TestScriptVariable.self, from: data)
            case "Timing":
                return try decode(Timing.self, from: data)
            case "TimingRepeat":
                return try decode(TimingRepeat.self, from: data)
            case "ValueSet":
                return try decode(ValueSet.self, from: data)
            case "ValueSetCodeSystem":
                return try decode(ValueSetCodeSystem.self, from: data)
            case "ValueSetCodeSystemConcept":
                return try decode(ValueSetCodeSystemConcept.self, from: data)
            case "ValueSetCodeSystemConceptDesignation":
                return try decode(ValueSetCodeSystemConceptDesignation.self, from: data)
            case "ValueSetCompose":
                return try decode(ValueSetCompose.self, from: data)
            case "ValueSetComposeInclude":
                return try decode(ValueSetComposeInclude.self, from: data)
            case "ValueSetComposeIncludeConcept":
                return try decode(ValueSetComposeIncludeConcept.self, from: data)
            case "ValueSetComposeIncludeFilter":
                return try decode(ValueSetComposeIncludeFilter.self, from: data)
            case "ValueSetContact":
                return try decode(ValueSetContact.self, from: data)
            case "ValueSetExpansion":
                return try decode(ValueSetExpansion.self, from: data)
            case "ValueSetExpansionContains":
                return try decode(ValueSetExpansionContains.self, from: data)
            case "ValueSetExpansionParameter":
                return try decode(ValueSetExpansionParameter.self, from: data)
            case "VisionPrescription":
                return try decode(VisionPrescription.self, from: data)
            case "VisionPrescriptionDispense":
                return try decode(VisionPrescriptionDispense.self, from: data)
            default:
                throw UnknownFhirDecodingTypeError(className: resourceClassName)
        }
    }
}