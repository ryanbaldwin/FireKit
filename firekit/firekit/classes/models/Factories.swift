//
//  FHIRAbstractBase+Factory.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//


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