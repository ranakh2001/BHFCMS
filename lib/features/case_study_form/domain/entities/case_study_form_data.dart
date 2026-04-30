class FamilyHealthCondition {
  final String personRelation;
  final String diseaseName;

  const FamilyHealthCondition({
    this.personRelation = '',
    this.diseaseName = '',
  });

  FamilyHealthCondition copyWith({String? personRelation, String? diseaseName}) =>
      FamilyHealthCondition(
        personRelation: personRelation ?? this.personRelation,
        diseaseName: diseaseName ?? this.diseaseName,
      );

  Map<String, dynamic> toJson() => {
        'personRelation': personRelation,
        'diseaseName': diseaseName,
      };

  factory FamilyHealthCondition.fromJson(Map<String, dynamic> json) =>
      FamilyHealthCondition(
        personRelation: json['personRelation'] as String? ?? '',
        diseaseName: json['diseaseName'] as String? ?? '',
      );
}

class Section1Data {
  // Display-only fields (pre-populated from child profile)
  final String childName;
  final String referenceNumber;
  final DateTime? dateOfBirth;
  final String childAge;
  final String gender;
  final String nationality;
  final String primaryLanguage;
  final String address;
  final String caregiverName;
  final String caregiverRelationship;
  final String phoneNumber;
  final String email;
  // Therapist-filled fields
  final String referralSource;
  final String referralSourceOther;
  final String mainServiceReason;

  const Section1Data({
    this.childName = '',
    this.referenceNumber = '',
    this.dateOfBirth,
    this.childAge = '',
    this.gender = '',
    this.nationality = '',
    this.primaryLanguage = '',
    this.address = '',
    this.caregiverName = '',
    this.caregiverRelationship = '',
    this.phoneNumber = '',
    this.email = '',
    this.referralSource = '',
    this.referralSourceOther = '',
    this.mainServiceReason = '',
  });

  Section1Data copyWith({
    String? childName,
    String? referenceNumber,
    DateTime? dateOfBirth,
    bool clearDateOfBirth = false,
    String? childAge,
    String? gender,
    String? nationality,
    String? primaryLanguage,
    String? address,
    String? caregiverName,
    String? caregiverRelationship,
    String? phoneNumber,
    String? email,
    String? referralSource,
    String? referralSourceOther,
    String? mainServiceReason,
  }) =>
      Section1Data(
        childName: childName ?? this.childName,
        referenceNumber: referenceNumber ?? this.referenceNumber,
        dateOfBirth: clearDateOfBirth ? null : (dateOfBirth ?? this.dateOfBirth),
        childAge: childAge ?? this.childAge,
        gender: gender ?? this.gender,
        nationality: nationality ?? this.nationality,
        primaryLanguage: primaryLanguage ?? this.primaryLanguage,
        address: address ?? this.address,
        caregiverName: caregiverName ?? this.caregiverName,
        caregiverRelationship: caregiverRelationship ?? this.caregiverRelationship,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        referralSource: referralSource ?? this.referralSource,
        referralSourceOther: referralSourceOther ?? this.referralSourceOther,
        mainServiceReason: mainServiceReason ?? this.mainServiceReason,
      );

  Map<String, dynamic> toJson() => {
        'childName': childName,
        'referenceNumber': referenceNumber,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'childAge': childAge,
        'gender': gender,
        'nationality': nationality,
        'primaryLanguage': primaryLanguage,
        'address': address,
        'caregiverName': caregiverName,
        'caregiverRelationship': caregiverRelationship,
        'phoneNumber': phoneNumber,
        'email': email,
        'referralSource': referralSource,
        'referralSourceOther': referralSourceOther,
        'mainServiceReason': mainServiceReason,
      };

  factory Section1Data.fromJson(Map<String, dynamic> json) => Section1Data(
        childName: json['childName'] as String? ?? '',
        referenceNumber: json['referenceNumber'] as String? ?? '',
        dateOfBirth: json['dateOfBirth'] != null
            ? DateTime.tryParse(json['dateOfBirth'] as String)
            : null,
        childAge: json['childAge'] as String? ?? '',
        gender: json['gender'] as String? ?? '',
        nationality: json['nationality'] as String? ?? '',
        primaryLanguage: json['primaryLanguage'] as String? ?? '',
        address: json['address'] as String? ?? '',
        caregiverName: json['caregiverName'] as String? ?? '',
        caregiverRelationship: json['caregiverRelationship'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        email: json['email'] as String? ?? '',
        referralSource: json['referralSource'] as String? ?? '',
        referralSourceOther: json['referralSourceOther'] as String? ?? '',
        mainServiceReason: json['mainServiceReason'] as String? ?? '',
      );
}

// ---------------------------------------------------------------------------
// Section 2 supporting models
// ---------------------------------------------------------------------------

class ResidentMember {
  final String name;
  final String age;
  final String relationship;
  final String residence; // 'home1' | 'home2' | 'does_not_reside'

  const ResidentMember({
    this.name = '',
    this.age = '',
    this.relationship = '',
    this.residence = '',
  });

  ResidentMember copyWith({
    String? name,
    String? age,
    String? relationship,
    String? residence,
  }) =>
      ResidentMember(
        name: name ?? this.name,
        age: age ?? this.age,
        relationship: relationship ?? this.relationship,
        residence: residence ?? this.residence,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'relationship': relationship,
        'residence': residence,
      };

  factory ResidentMember.fromJson(Map<String, dynamic> json) => ResidentMember(
        name: json['name'] as String? ?? '',
        age: json['age'] as String? ?? '',
        relationship: json['relationship'] as String? ?? '',
        residence: json['residence'] as String? ?? '',
      );
}

class FamilyConditionEntry {
  final String who; // 'father' | 'mother' | 'paternal_rel' | 'other_rel' | 'none'
  final String relation;

  const FamilyConditionEntry({this.who = 'none', this.relation = ''});

  FamilyConditionEntry copyWith({String? who, String? relation}) =>
      FamilyConditionEntry(
        who: who ?? this.who,
        relation: relation ?? this.relation,
      );

  Map<String, dynamic> toJson() => {'who': who, 'relation': relation};

  factory FamilyConditionEntry.fromJson(Map<String, dynamic> json) =>
      FamilyConditionEntry(
        who: json['who'] as String? ?? 'none',
        relation: json['relation'] as String? ?? '',
      );
}

// ---------------------------------------------------------------------------

class Section2Data {
  final String maritalStatus; // 'married'|'separated'|'divorced'|'one_deceased'
  final String firstHomeDesc;
  final String firstHomeOwner;
  final String secondHomeDesc;
  final String secondHomeOwner;
  final String motherOccupation;
  final String motherEducation;
  final String fatherOccupation;
  final String fatherEducation;
  final String decisionMaker; // 'father'|'mother'|'both'|'legal_guardian'
  final String separationDecision;
  final bool? bothParentsAware;
  final List<ResidentMember> familyMembers;
  final FamilyConditionEntry autismSpectrum;
  final FamilyConditionEntry languageDelay;
  final FamilyConditionEntry learningDifficulty;
  final FamilyConditionEntry adhd;
  final FamilyConditionEntry moodDisorders;

  const Section2Data({
    this.maritalStatus = '',
    this.firstHomeDesc = '',
    this.firstHomeOwner = '',
    this.secondHomeDesc = '',
    this.secondHomeOwner = '',
    this.motherOccupation = '',
    this.motherEducation = '',
    this.fatherOccupation = '',
    this.fatherEducation = '',
    this.decisionMaker = '',
    this.separationDecision = '',
    this.bothParentsAware,
    this.familyMembers = const [],
    this.autismSpectrum = const FamilyConditionEntry(),
    this.languageDelay = const FamilyConditionEntry(),
    this.learningDifficulty = const FamilyConditionEntry(),
    this.adhd = const FamilyConditionEntry(),
    this.moodDisorders = const FamilyConditionEntry(),
  });

  Section2Data copyWith({
    String? maritalStatus,
    String? firstHomeDesc,
    String? firstHomeOwner,
    String? secondHomeDesc,
    String? secondHomeOwner,
    String? motherOccupation,
    String? motherEducation,
    String? fatherOccupation,
    String? fatherEducation,
    String? decisionMaker,
    String? separationDecision,
    bool? bothParentsAware,
    List<ResidentMember>? familyMembers,
    FamilyConditionEntry? autismSpectrum,
    FamilyConditionEntry? languageDelay,
    FamilyConditionEntry? learningDifficulty,
    FamilyConditionEntry? adhd,
    FamilyConditionEntry? moodDisorders,
  }) =>
      Section2Data(
        maritalStatus: maritalStatus ?? this.maritalStatus,
        firstHomeDesc: firstHomeDesc ?? this.firstHomeDesc,
        firstHomeOwner: firstHomeOwner ?? this.firstHomeOwner,
        secondHomeDesc: secondHomeDesc ?? this.secondHomeDesc,
        secondHomeOwner: secondHomeOwner ?? this.secondHomeOwner,
        motherOccupation: motherOccupation ?? this.motherOccupation,
        motherEducation: motherEducation ?? this.motherEducation,
        fatherOccupation: fatherOccupation ?? this.fatherOccupation,
        fatherEducation: fatherEducation ?? this.fatherEducation,
        decisionMaker: decisionMaker ?? this.decisionMaker,
        separationDecision: separationDecision ?? this.separationDecision,
        bothParentsAware: bothParentsAware ?? this.bothParentsAware,
        familyMembers: familyMembers ?? this.familyMembers,
        autismSpectrum: autismSpectrum ?? this.autismSpectrum,
        languageDelay: languageDelay ?? this.languageDelay,
        learningDifficulty: learningDifficulty ?? this.learningDifficulty,
        adhd: adhd ?? this.adhd,
        moodDisorders: moodDisorders ?? this.moodDisorders,
      );

  Map<String, dynamic> toJson() => {
        'maritalStatus': maritalStatus,
        'firstHomeDesc': firstHomeDesc,
        'firstHomeOwner': firstHomeOwner,
        'secondHomeDesc': secondHomeDesc,
        'secondHomeOwner': secondHomeOwner,
        'motherOccupation': motherOccupation,
        'motherEducation': motherEducation,
        'fatherOccupation': fatherOccupation,
        'fatherEducation': fatherEducation,
        'decisionMaker': decisionMaker,
        'separationDecision': separationDecision,
        'bothParentsAware': bothParentsAware,
        'familyMembers': familyMembers.map((m) => m.toJson()).toList(),
        'autismSpectrum': autismSpectrum.toJson(),
        'languageDelay': languageDelay.toJson(),
        'learningDifficulty': learningDifficulty.toJson(),
        'adhd': adhd.toJson(),
        'moodDisorders': moodDisorders.toJson(),
      };

  factory Section2Data.fromJson(Map<String, dynamic> json) => Section2Data(
        maritalStatus: json['maritalStatus'] as String? ?? '',
        firstHomeDesc: json['firstHomeDesc'] as String? ?? '',
        firstHomeOwner: json['firstHomeOwner'] as String? ?? '',
        secondHomeDesc: json['secondHomeDesc'] as String? ?? '',
        secondHomeOwner: json['secondHomeOwner'] as String? ?? '',
        motherOccupation: json['motherOccupation'] as String? ?? '',
        motherEducation: json['motherEducation'] as String? ?? '',
        fatherOccupation: json['fatherOccupation'] as String? ?? '',
        fatherEducation: json['fatherEducation'] as String? ?? '',
        decisionMaker: json['decisionMaker'] as String? ?? '',
        separationDecision: json['separationDecision'] as String? ?? '',
        bothParentsAware: json['bothParentsAware'] as bool?,
        familyMembers: (json['familyMembers'] as List<dynamic>?)
                ?.map((e) =>
                    ResidentMember.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        autismSpectrum: json['autismSpectrum'] != null
            ? FamilyConditionEntry.fromJson(
                json['autismSpectrum'] as Map<String, dynamic>)
            : const FamilyConditionEntry(),
        languageDelay: json['languageDelay'] != null
            ? FamilyConditionEntry.fromJson(
                json['languageDelay'] as Map<String, dynamic>)
            : const FamilyConditionEntry(),
        learningDifficulty: json['learningDifficulty'] != null
            ? FamilyConditionEntry.fromJson(
                json['learningDifficulty'] as Map<String, dynamic>)
            : const FamilyConditionEntry(),
        adhd: json['adhd'] != null
            ? FamilyConditionEntry.fromJson(
                json['adhd'] as Map<String, dynamic>)
            : const FamilyConditionEntry(),
        moodDisorders: json['moodDisorders'] != null
            ? FamilyConditionEntry.fromJson(
                json['moodDisorders'] as Map<String, dynamic>)
            : const FamilyConditionEntry(),
      );
}

class Section3Data {
  // Pregnancy basics
  final String liveBirthCount;
  final String stillbirthCount;
  final String motherAgeAtBirth;
  final String fatherAgeAtBirth;
  final String parentKinship; // 'first' | 'second' | 'none'
  final bool? wasPlanned;
  final bool? usedFertilityTreatment;
  // Medications — 'vitamins' | 'supplements' | 'antidepressants' | 'anti_seizure' | 'other' | 'unsure'
  final String medications;
  final String medicationsOther;
  // Pregnancy difficulties — 'yes' | 'no' | 'unsure'
  final String feverInfection;
  final String bleedingMiscarriage;
  final String highBpDiabetes;
  final String severeStressAccidents;
  // Labor & delivery
  final String usedPitocin;
  final String prematureBirth;
  final String prematureWeeks;
  final String deliveryComplications;
  final String complicationsType;
  final String nicuResuscitation;
  final String nicuReason;
  final String nicuDuration;
  final String deliveryType; // 'natural' | 'cesarean'
  final String cesareanReason;
  // First month problems (multi-select stored as List<String>)
  final List<String> firstMonthProblems;

  const Section3Data({
    this.liveBirthCount = '',
    this.stillbirthCount = '',
    this.motherAgeAtBirth = '',
    this.fatherAgeAtBirth = '',
    this.parentKinship = '',
    this.wasPlanned,
    this.usedFertilityTreatment,
    this.medications = '',
    this.medicationsOther = '',
    this.feverInfection = '',
    this.bleedingMiscarriage = '',
    this.highBpDiabetes = '',
    this.severeStressAccidents = '',
    this.usedPitocin = '',
    this.prematureBirth = '',
    this.prematureWeeks = '',
    this.deliveryComplications = '',
    this.complicationsType = '',
    this.nicuResuscitation = '',
    this.nicuReason = '',
    this.nicuDuration = '',
    this.deliveryType = '',
    this.cesareanReason = '',
    this.firstMonthProblems = const [],
  });

  Section3Data copyWith({
    String? liveBirthCount,
    String? stillbirthCount,
    String? motherAgeAtBirth,
    String? fatherAgeAtBirth,
    String? parentKinship,
    bool? wasPlanned,
    bool? usedFertilityTreatment,
    String? medications,
    String? medicationsOther,
    String? feverInfection,
    String? bleedingMiscarriage,
    String? highBpDiabetes,
    String? severeStressAccidents,
    String? usedPitocin,
    String? prematureBirth,
    String? prematureWeeks,
    String? deliveryComplications,
    String? complicationsType,
    String? nicuResuscitation,
    String? nicuReason,
    String? nicuDuration,
    String? deliveryType,
    String? cesareanReason,
    List<String>? firstMonthProblems,
  }) =>
      Section3Data(
        liveBirthCount: liveBirthCount ?? this.liveBirthCount,
        stillbirthCount: stillbirthCount ?? this.stillbirthCount,
        motherAgeAtBirth: motherAgeAtBirth ?? this.motherAgeAtBirth,
        fatherAgeAtBirth: fatherAgeAtBirth ?? this.fatherAgeAtBirth,
        parentKinship: parentKinship ?? this.parentKinship,
        wasPlanned: wasPlanned ?? this.wasPlanned,
        usedFertilityTreatment:
            usedFertilityTreatment ?? this.usedFertilityTreatment,
        medications: medications ?? this.medications,
        medicationsOther: medicationsOther ?? this.medicationsOther,
        feverInfection: feverInfection ?? this.feverInfection,
        bleedingMiscarriage: bleedingMiscarriage ?? this.bleedingMiscarriage,
        highBpDiabetes: highBpDiabetes ?? this.highBpDiabetes,
        severeStressAccidents:
            severeStressAccidents ?? this.severeStressAccidents,
        usedPitocin: usedPitocin ?? this.usedPitocin,
        prematureBirth: prematureBirth ?? this.prematureBirth,
        prematureWeeks: prematureWeeks ?? this.prematureWeeks,
        deliveryComplications:
            deliveryComplications ?? this.deliveryComplications,
        complicationsType: complicationsType ?? this.complicationsType,
        nicuResuscitation: nicuResuscitation ?? this.nicuResuscitation,
        nicuReason: nicuReason ?? this.nicuReason,
        nicuDuration: nicuDuration ?? this.nicuDuration,
        deliveryType: deliveryType ?? this.deliveryType,
        cesareanReason: cesareanReason ?? this.cesareanReason,
        firstMonthProblems: firstMonthProblems ?? this.firstMonthProblems,
      );

  Map<String, dynamic> toJson() => {
        'liveBirthCount': liveBirthCount,
        'stillbirthCount': stillbirthCount,
        'motherAgeAtBirth': motherAgeAtBirth,
        'fatherAgeAtBirth': fatherAgeAtBirth,
        'parentKinship': parentKinship,
        'wasPlanned': wasPlanned,
        'usedFertilityTreatment': usedFertilityTreatment,
        'medications': medications,
        'medicationsOther': medicationsOther,
        'feverInfection': feverInfection,
        'bleedingMiscarriage': bleedingMiscarriage,
        'highBpDiabetes': highBpDiabetes,
        'severeStressAccidents': severeStressAccidents,
        'usedPitocin': usedPitocin,
        'prematureBirth': prematureBirth,
        'prematureWeeks': prematureWeeks,
        'deliveryComplications': deliveryComplications,
        'complicationsType': complicationsType,
        'nicuResuscitation': nicuResuscitation,
        'nicuReason': nicuReason,
        'nicuDuration': nicuDuration,
        'deliveryType': deliveryType,
        'cesareanReason': cesareanReason,
        'firstMonthProblems': firstMonthProblems,
      };

  factory Section3Data.fromJson(Map<String, dynamic> json) => Section3Data(
        liveBirthCount: json['liveBirthCount'] as String? ?? '',
        stillbirthCount: json['stillbirthCount'] as String? ?? '',
        motherAgeAtBirth: json['motherAgeAtBirth'] as String? ?? '',
        fatherAgeAtBirth: json['fatherAgeAtBirth'] as String? ?? '',
        parentKinship: json['parentKinship'] as String? ?? '',
        wasPlanned: json['wasPlanned'] as bool?,
        usedFertilityTreatment: json['usedFertilityTreatment'] as bool?,
        medications: json['medications'] as String? ?? '',
        medicationsOther: json['medicationsOther'] as String? ?? '',
        feverInfection: json['feverInfection'] as String? ?? '',
        bleedingMiscarriage: json['bleedingMiscarriage'] as String? ?? '',
        highBpDiabetes: json['highBpDiabetes'] as String? ?? '',
        severeStressAccidents: json['severeStressAccidents'] as String? ?? '',
        usedPitocin: json['usedPitocin'] as String? ?? '',
        prematureBirth: json['prematureBirth'] as String? ?? '',
        prematureWeeks: json['prematureWeeks'] as String? ?? '',
        deliveryComplications: json['deliveryComplications'] as String? ?? '',
        complicationsType: json['complicationsType'] as String? ?? '',
        nicuResuscitation: json['nicuResuscitation'] as String? ?? '',
        nicuReason: json['nicuReason'] as String? ?? '',
        nicuDuration: json['nicuDuration'] as String? ?? '',
        deliveryType: json['deliveryType'] as String? ?? '',
        cesareanReason: json['cesareanReason'] as String? ?? '',
        firstMonthProblems:
            (json['firstMonthProblems'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            const [],
      );
}

// =============================================================================
// Section 4 — Medical History (التاريخ الطبي)
// =============================================================================

/// One entry in the previous-treatment history dynamic list.
class TreatmentEntry {
  final String treatmentType;
  final String organization;
  final String duration;
  final String notes;

  const TreatmentEntry({
    this.treatmentType = '',
    this.organization = '',
    this.duration = '',
    this.notes = '',
  });

  TreatmentEntry copyWith({
    String? treatmentType,
    String? organization,
    String? duration,
    String? notes,
  }) =>
      TreatmentEntry(
        treatmentType: treatmentType ?? this.treatmentType,
        organization: organization ?? this.organization,
        duration: duration ?? this.duration,
        notes: notes ?? this.notes,
      );

  Map<String, dynamic> toJson() => {
        'treatmentType': treatmentType,
        'organization': organization,
        'duration': duration,
        'notes': notes,
      };

  factory TreatmentEntry.fromJson(Map<String, dynamic> json) => TreatmentEntry(
        treatmentType: json['treatmentType'] as String? ?? '',
        organization: json['organization'] as String? ?? '',
        duration: json['duration'] as String? ?? '',
        notes: json['notes'] as String? ?? '',
      );
}

/// One entry in the current-medications dynamic list.
class MedicationEntry {
  final String name;
  final String dosageAndTiming;
  final String duration;
  final String notes;

  const MedicationEntry({
    this.name = '',
    this.dosageAndTiming = '',
    this.duration = '',
    this.notes = '',
  });

  MedicationEntry copyWith({
    String? name,
    String? dosageAndTiming,
    String? duration,
    String? notes,
  }) =>
      MedicationEntry(
        name: name ?? this.name,
        dosageAndTiming: dosageAndTiming ?? this.dosageAndTiming,
        duration: duration ?? this.duration,
        notes: notes ?? this.notes,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'dosageAndTiming': dosageAndTiming,
        'duration': duration,
        'notes': notes,
      };

  factory MedicationEntry.fromJson(Map<String, dynamic> json) =>
      MedicationEntry(
        name: json['name'] as String? ?? '',
        dosageAndTiming: json['dosageAndTiming'] as String? ?? '',
        duration: json['duration'] as String? ?? '',
        notes: json['notes'] as String? ?? '',
      );
}

/// Result of a single medical assessment (normal / abnormal + free-text notes).
class AssessmentResult {
  final String result; // 'normal' | 'abnormal' | ''
  final String notes;

  const AssessmentResult({this.result = '', this.notes = ''});

  AssessmentResult copyWith({String? result, String? notes}) =>
      AssessmentResult(
        result: result ?? this.result,
        notes: notes ?? this.notes,
      );

  Map<String, dynamic> toJson() => {'result': result, 'notes': notes};

  factory AssessmentResult.fromJson(Map<String, dynamic> json) =>
      AssessmentResult(
        result: json['result'] as String? ?? '',
        notes: json['notes'] as String? ?? '',
      );
}

class Section4Data {
  // 1. Comprehensive medical history (yes / no per condition)
  final bool? hearingVisionIssues;
  final bool? seizuresHeadInjury;
  final bool? sleepNutritionIssues;
  final bool? bloodAnemiaRespHeart;
  final bool? dentalPerceptionIssues;
  final bool? fattyFailureStunting;

  // 2. Previous treatment history (dynamic list)
  final List<TreatmentEntry> previousTreatments;

  // 3. Current medications & biological interventions (dynamic list)
  final List<MedicationEntry> currentMedications;

  // 4. Diagnoses: 'diagnosed' | 'suspected' | ''
  final String asdDiagnosis;
  final String adhdDiagnosis;
  final String learningDelayDiagnosis;
  final String downSyndromeDiagnosis;
  final String otherDiagnosis;

  // 5. Medical assessments
  final AssessmentResult auditoryVisualAssessment;
  final AssessmentResult brainScanEEG;
  final AssessmentResult geneticTest;
  final AssessmentResult psychoIQTest;

  // 6. Diet, allergies & alternative medicines
  final bool? hasAllergies;
  final String allergyType;
  final String specialDiet; // 'gluten_free'|'casein_free'|'biometric'|'other'|''
  final String specialDietOther;
  final bool? hasAlternativeVaccines;
  final String alternativeVaccinesDesc;
  final bool? allVaccinesOnTime;

  const Section4Data({
    this.hearingVisionIssues,
    this.seizuresHeadInjury,
    this.sleepNutritionIssues,
    this.bloodAnemiaRespHeart,
    this.dentalPerceptionIssues,
    this.fattyFailureStunting,
    this.previousTreatments = const [],
    this.currentMedications = const [],
    this.asdDiagnosis = '',
    this.adhdDiagnosis = '',
    this.learningDelayDiagnosis = '',
    this.downSyndromeDiagnosis = '',
    this.otherDiagnosis = '',
    this.auditoryVisualAssessment = const AssessmentResult(),
    this.brainScanEEG = const AssessmentResult(),
    this.geneticTest = const AssessmentResult(),
    this.psychoIQTest = const AssessmentResult(),
    this.hasAllergies,
    this.allergyType = '',
    this.specialDiet = '',
    this.specialDietOther = '',
    this.hasAlternativeVaccines,
    this.alternativeVaccinesDesc = '',
    this.allVaccinesOnTime,
  });

  Section4Data copyWith({
    bool? hearingVisionIssues,
    bool? seizuresHeadInjury,
    bool? sleepNutritionIssues,
    bool? bloodAnemiaRespHeart,
    bool? dentalPerceptionIssues,
    bool? fattyFailureStunting,
    List<TreatmentEntry>? previousTreatments,
    List<MedicationEntry>? currentMedications,
    String? asdDiagnosis,
    String? adhdDiagnosis,
    String? learningDelayDiagnosis,
    String? downSyndromeDiagnosis,
    String? otherDiagnosis,
    AssessmentResult? auditoryVisualAssessment,
    AssessmentResult? brainScanEEG,
    AssessmentResult? geneticTest,
    AssessmentResult? psychoIQTest,
    bool? hasAllergies,
    String? allergyType,
    String? specialDiet,
    String? specialDietOther,
    bool? hasAlternativeVaccines,
    String? alternativeVaccinesDesc,
    bool? allVaccinesOnTime,
  }) =>
      Section4Data(
        hearingVisionIssues: hearingVisionIssues ?? this.hearingVisionIssues,
        seizuresHeadInjury: seizuresHeadInjury ?? this.seizuresHeadInjury,
        sleepNutritionIssues: sleepNutritionIssues ?? this.sleepNutritionIssues,
        bloodAnemiaRespHeart: bloodAnemiaRespHeart ?? this.bloodAnemiaRespHeart,
        dentalPerceptionIssues:
            dentalPerceptionIssues ?? this.dentalPerceptionIssues,
        fattyFailureStunting: fattyFailureStunting ?? this.fattyFailureStunting,
        previousTreatments: previousTreatments ?? this.previousTreatments,
        currentMedications: currentMedications ?? this.currentMedications,
        asdDiagnosis: asdDiagnosis ?? this.asdDiagnosis,
        adhdDiagnosis: adhdDiagnosis ?? this.adhdDiagnosis,
        learningDelayDiagnosis:
            learningDelayDiagnosis ?? this.learningDelayDiagnosis,
        downSyndromeDiagnosis:
            downSyndromeDiagnosis ?? this.downSyndromeDiagnosis,
        otherDiagnosis: otherDiagnosis ?? this.otherDiagnosis,
        auditoryVisualAssessment:
            auditoryVisualAssessment ?? this.auditoryVisualAssessment,
        brainScanEEG: brainScanEEG ?? this.brainScanEEG,
        geneticTest: geneticTest ?? this.geneticTest,
        psychoIQTest: psychoIQTest ?? this.psychoIQTest,
        hasAllergies: hasAllergies ?? this.hasAllergies,
        allergyType: allergyType ?? this.allergyType,
        specialDiet: specialDiet ?? this.specialDiet,
        specialDietOther: specialDietOther ?? this.specialDietOther,
        hasAlternativeVaccines:
            hasAlternativeVaccines ?? this.hasAlternativeVaccines,
        alternativeVaccinesDesc:
            alternativeVaccinesDesc ?? this.alternativeVaccinesDesc,
        allVaccinesOnTime: allVaccinesOnTime ?? this.allVaccinesOnTime,
      );

  Map<String, dynamic> toJson() => {
        'hearingVisionIssues': hearingVisionIssues,
        'seizuresHeadInjury': seizuresHeadInjury,
        'sleepNutritionIssues': sleepNutritionIssues,
        'bloodAnemiaRespHeart': bloodAnemiaRespHeart,
        'dentalPerceptionIssues': dentalPerceptionIssues,
        'fattyFailureStunting': fattyFailureStunting,
        'previousTreatments':
            previousTreatments.map((e) => e.toJson()).toList(),
        'currentMedications':
            currentMedications.map((e) => e.toJson()).toList(),
        'asdDiagnosis': asdDiagnosis,
        'adhdDiagnosis': adhdDiagnosis,
        'learningDelayDiagnosis': learningDelayDiagnosis,
        'downSyndromeDiagnosis': downSyndromeDiagnosis,
        'otherDiagnosis': otherDiagnosis,
        'auditoryVisualAssessment': auditoryVisualAssessment.toJson(),
        'brainScanEEG': brainScanEEG.toJson(),
        'geneticTest': geneticTest.toJson(),
        'psychoIQTest': psychoIQTest.toJson(),
        'hasAllergies': hasAllergies,
        'allergyType': allergyType,
        'specialDiet': specialDiet,
        'specialDietOther': specialDietOther,
        'hasAlternativeVaccines': hasAlternativeVaccines,
        'alternativeVaccinesDesc': alternativeVaccinesDesc,
        'allVaccinesOnTime': allVaccinesOnTime,
      };

  factory Section4Data.fromJson(Map<String, dynamic> json) => Section4Data(
        hearingVisionIssues: json['hearingVisionIssues'] as bool?,
        seizuresHeadInjury: json['seizuresHeadInjury'] as bool?,
        sleepNutritionIssues: json['sleepNutritionIssues'] as bool?,
        bloodAnemiaRespHeart: json['bloodAnemiaRespHeart'] as bool?,
        dentalPerceptionIssues: json['dentalPerceptionIssues'] as bool?,
        fattyFailureStunting: json['fattyFailureStunting'] as bool?,
        previousTreatments: (json['previousTreatments'] as List<dynamic>?)
                ?.map((e) =>
                    TreatmentEntry.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
        currentMedications: (json['currentMedications'] as List<dynamic>?)
                ?.map((e) =>
                    MedicationEntry.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
        asdDiagnosis: json['asdDiagnosis'] as String? ?? '',
        adhdDiagnosis: json['adhdDiagnosis'] as String? ?? '',
        learningDelayDiagnosis:
            json['learningDelayDiagnosis'] as String? ?? '',
        downSyndromeDiagnosis:
            json['downSyndromeDiagnosis'] as String? ?? '',
        otherDiagnosis: json['otherDiagnosis'] as String? ?? '',
        auditoryVisualAssessment: json['auditoryVisualAssessment'] != null
            ? AssessmentResult.fromJson(
                json['auditoryVisualAssessment'] as Map<String, dynamic>)
            : const AssessmentResult(),
        brainScanEEG: json['brainScanEEG'] != null
            ? AssessmentResult.fromJson(
                json['brainScanEEG'] as Map<String, dynamic>)
            : const AssessmentResult(),
        geneticTest: json['geneticTest'] != null
            ? AssessmentResult.fromJson(
                json['geneticTest'] as Map<String, dynamic>)
            : const AssessmentResult(),
        psychoIQTest: json['psychoIQTest'] != null
            ? AssessmentResult.fromJson(
                json['psychoIQTest'] as Map<String, dynamic>)
            : const AssessmentResult(),
        hasAllergies: json['hasAllergies'] as bool?,
        allergyType: json['allergyType'] as String? ?? '',
        specialDiet: json['specialDiet'] as String? ?? '',
        specialDietOther: json['specialDietOther'] as String? ?? '',
        hasAlternativeVaccines: json['hasAlternativeVaccines'] as bool?,
        alternativeVaccinesDesc:
            json['alternativeVaccinesDesc'] as String? ?? '',
        allVaccinesOnTime: json['allVaccinesOnTime'] as bool?,
      );
}

// =============================================================================
// Section 5 — Developmental History (التاريخ النمائي)
// =============================================================================

class Section5Data {
  // Social / Emotional checkboxes
  final bool socialSmile;
  final bool knowsFamilyMembers;
  final bool respondsToName;
  final bool showsAffection;
  final bool shyOrFearful;

  // Cognitive checkboxes
  final bool imitatesAdults;
  final bool putsObjectsInMouth;
  final bool recognizesColors;
  final bool imaginativePlay;
  final bool followsInstructions;

  // Language / Communication checkboxes
  final bool cooing;
  final bool twoWordPhrases;
  final bool usesGestures;
  final bool requestsByWords;

  // Motor / Physical checkboxes
  final bool sittingCrawling;
  final bool jumpingClimbing;
  final bool walkingWithoutHelp;
  final bool holdingPenDrawing;
  final bool kickingThrowing;

  // Developmental milestone ages + notes
  final String socialSmileAge;
  final String socialSmileNotes;
  final String independentSittingAge;
  final String independentSittingNotes;
  final String independentWalkingAge;
  final String independentWalkingNotes;
  final String firstWordAge;
  final String firstWordNotes;

  // Skill regression
  final bool? hadSkillRegression;
  final String regressionAge;
  final String regressionDetails;

  const Section5Data({
    this.socialSmile = false,
    this.knowsFamilyMembers = false,
    this.respondsToName = false,
    this.showsAffection = false,
    this.shyOrFearful = false,
    this.imitatesAdults = false,
    this.putsObjectsInMouth = false,
    this.recognizesColors = false,
    this.imaginativePlay = false,
    this.followsInstructions = false,
    this.cooing = false,
    this.twoWordPhrases = false,
    this.usesGestures = false,
    this.requestsByWords = false,
    this.sittingCrawling = false,
    this.jumpingClimbing = false,
    this.walkingWithoutHelp = false,
    this.holdingPenDrawing = false,
    this.kickingThrowing = false,
    this.socialSmileAge = '',
    this.socialSmileNotes = '',
    this.independentSittingAge = '',
    this.independentSittingNotes = '',
    this.independentWalkingAge = '',
    this.independentWalkingNotes = '',
    this.firstWordAge = '',
    this.firstWordNotes = '',
    this.hadSkillRegression,
    this.regressionAge = '',
    this.regressionDetails = '',
  });

  Section5Data copyWith({
    bool? socialSmile,
    bool? knowsFamilyMembers,
    bool? respondsToName,
    bool? showsAffection,
    bool? shyOrFearful,
    bool? imitatesAdults,
    bool? putsObjectsInMouth,
    bool? recognizesColors,
    bool? imaginativePlay,
    bool? followsInstructions,
    bool? cooing,
    bool? twoWordPhrases,
    bool? usesGestures,
    bool? requestsByWords,
    bool? sittingCrawling,
    bool? jumpingClimbing,
    bool? walkingWithoutHelp,
    bool? holdingPenDrawing,
    bool? kickingThrowing,
    String? socialSmileAge,
    String? socialSmileNotes,
    String? independentSittingAge,
    String? independentSittingNotes,
    String? independentWalkingAge,
    String? independentWalkingNotes,
    String? firstWordAge,
    String? firstWordNotes,
    bool? hadSkillRegression,
    String? regressionAge,
    String? regressionDetails,
  }) =>
      Section5Data(
        socialSmile: socialSmile ?? this.socialSmile,
        knowsFamilyMembers: knowsFamilyMembers ?? this.knowsFamilyMembers,
        respondsToName: respondsToName ?? this.respondsToName,
        showsAffection: showsAffection ?? this.showsAffection,
        shyOrFearful: shyOrFearful ?? this.shyOrFearful,
        imitatesAdults: imitatesAdults ?? this.imitatesAdults,
        putsObjectsInMouth: putsObjectsInMouth ?? this.putsObjectsInMouth,
        recognizesColors: recognizesColors ?? this.recognizesColors,
        imaginativePlay: imaginativePlay ?? this.imaginativePlay,
        followsInstructions: followsInstructions ?? this.followsInstructions,
        cooing: cooing ?? this.cooing,
        twoWordPhrases: twoWordPhrases ?? this.twoWordPhrases,
        usesGestures: usesGestures ?? this.usesGestures,
        requestsByWords: requestsByWords ?? this.requestsByWords,
        sittingCrawling: sittingCrawling ?? this.sittingCrawling,
        jumpingClimbing: jumpingClimbing ?? this.jumpingClimbing,
        walkingWithoutHelp: walkingWithoutHelp ?? this.walkingWithoutHelp,
        holdingPenDrawing: holdingPenDrawing ?? this.holdingPenDrawing,
        kickingThrowing: kickingThrowing ?? this.kickingThrowing,
        socialSmileAge: socialSmileAge ?? this.socialSmileAge,
        socialSmileNotes: socialSmileNotes ?? this.socialSmileNotes,
        independentSittingAge:
            independentSittingAge ?? this.independentSittingAge,
        independentSittingNotes:
            independentSittingNotes ?? this.independentSittingNotes,
        independentWalkingAge:
            independentWalkingAge ?? this.independentWalkingAge,
        independentWalkingNotes:
            independentWalkingNotes ?? this.independentWalkingNotes,
        firstWordAge: firstWordAge ?? this.firstWordAge,
        firstWordNotes: firstWordNotes ?? this.firstWordNotes,
        hadSkillRegression: hadSkillRegression ?? this.hadSkillRegression,
        regressionAge: regressionAge ?? this.regressionAge,
        regressionDetails: regressionDetails ?? this.regressionDetails,
      );

  Map<String, dynamic> toJson() => {
        'socialSmile': socialSmile,
        'knowsFamilyMembers': knowsFamilyMembers,
        'respondsToName': respondsToName,
        'showsAffection': showsAffection,
        'shyOrFearful': shyOrFearful,
        'imitatesAdults': imitatesAdults,
        'putsObjectsInMouth': putsObjectsInMouth,
        'recognizesColors': recognizesColors,
        'imaginativePlay': imaginativePlay,
        'followsInstructions': followsInstructions,
        'cooing': cooing,
        'twoWordPhrases': twoWordPhrases,
        'usesGestures': usesGestures,
        'requestsByWords': requestsByWords,
        'sittingCrawling': sittingCrawling,
        'jumpingClimbing': jumpingClimbing,
        'walkingWithoutHelp': walkingWithoutHelp,
        'holdingPenDrawing': holdingPenDrawing,
        'kickingThrowing': kickingThrowing,
        'socialSmileAge': socialSmileAge,
        'socialSmileNotes': socialSmileNotes,
        'independentSittingAge': independentSittingAge,
        'independentSittingNotes': independentSittingNotes,
        'independentWalkingAge': independentWalkingAge,
        'independentWalkingNotes': independentWalkingNotes,
        'firstWordAge': firstWordAge,
        'firstWordNotes': firstWordNotes,
        'hadSkillRegression': hadSkillRegression,
        'regressionAge': regressionAge,
        'regressionDetails': regressionDetails,
      };

  factory Section5Data.fromJson(Map<String, dynamic> json) => Section5Data(
        socialSmile: json['socialSmile'] as bool? ?? false,
        knowsFamilyMembers: json['knowsFamilyMembers'] as bool? ?? false,
        respondsToName: json['respondsToName'] as bool? ?? false,
        showsAffection: json['showsAffection'] as bool? ?? false,
        shyOrFearful: json['shyOrFearful'] as bool? ?? false,
        imitatesAdults: json['imitatesAdults'] as bool? ?? false,
        putsObjectsInMouth: json['putsObjectsInMouth'] as bool? ?? false,
        recognizesColors: json['recognizesColors'] as bool? ?? false,
        imaginativePlay: json['imaginativePlay'] as bool? ?? false,
        followsInstructions: json['followsInstructions'] as bool? ?? false,
        cooing: json['cooing'] as bool? ?? false,
        twoWordPhrases: json['twoWordPhrases'] as bool? ?? false,
        usesGestures: json['usesGestures'] as bool? ?? false,
        requestsByWords: json['requestsByWords'] as bool? ?? false,
        sittingCrawling: json['sittingCrawling'] as bool? ?? false,
        jumpingClimbing: json['jumpingClimbing'] as bool? ?? false,
        walkingWithoutHelp: json['walkingWithoutHelp'] as bool? ?? false,
        holdingPenDrawing: json['holdingPenDrawing'] as bool? ?? false,
        kickingThrowing: json['kickingThrowing'] as bool? ?? false,
        socialSmileAge: json['socialSmileAge'] as String? ?? '',
        socialSmileNotes: json['socialSmileNotes'] as String? ?? '',
        independentSittingAge:
            json['independentSittingAge'] as String? ?? '',
        independentSittingNotes:
            json['independentSittingNotes'] as String? ?? '',
        independentWalkingAge:
            json['independentWalkingAge'] as String? ?? '',
        independentWalkingNotes:
            json['independentWalkingNotes'] as String? ?? '',
        firstWordAge: json['firstWordAge'] as String? ?? '',
        firstWordNotes: json['firstWordNotes'] as String? ?? '',
        hadSkillRegression: json['hadSkillRegression'] as bool?,
        regressionAge: json['regressionAge'] as String? ?? '',
        regressionDetails: json['regressionDetails'] as String? ?? '',
      );
}

// =============================================================================
// Section 6 — Medical Information & Birth History (Post-Birth Period)
// =============================================================================

class Section6Data {
  // 1. Basic communication methods (multi-select)
  // Values: 'single_words'|'short_sentences'|'full_sentences'|'signs'|'pecs'|'device'|'manual_pull'|'crying'|'other'
  final List<String> communicationMethods;
  final String communicationMethodOther;

  // 2. Expression & Understanding — each: 'yes'|'sometimes'|'no'
  final String expressesNeeds;
  final String requestsPreferred;
  final String understandsSimple;
  final String understandsComplex;

  // 3. Social communication traits (multi-select)
  // Values: 'initiates'|'responds'|'prefers_solo'|'imitates'|'difficulty_peers'|'difficulty_turns'
  final List<String> socialCommTraits;

  // 4. Additional notes
  final String communicationNotes;

  // 5. Social & Pragmatic skills assessment
  final String initiatesConversation;    // 'always'|'sometimes'|'rarely'
  final String maintainsEyeContact;      // 'always'|'sometimes'|'rarely'
  final String understandsBodyLanguage;  // 'good'|'acceptable'|'weak'
  final String understandsJokes;         // 'yes'|'partial'|'no'
  final String conversationTurnTaking;   // 'mastered'|'in_training'|'missing'

  const Section6Data({
    this.communicationMethods = const [],
    this.communicationMethodOther = '',
    this.expressesNeeds = '',
    this.requestsPreferred = '',
    this.understandsSimple = '',
    this.understandsComplex = '',
    this.socialCommTraits = const [],
    this.communicationNotes = '',
    this.initiatesConversation = '',
    this.maintainsEyeContact = '',
    this.understandsBodyLanguage = '',
    this.understandsJokes = '',
    this.conversationTurnTaking = '',
  });

  Section6Data copyWith({
    List<String>? communicationMethods,
    String? communicationMethodOther,
    String? expressesNeeds,
    String? requestsPreferred,
    String? understandsSimple,
    String? understandsComplex,
    List<String>? socialCommTraits,
    String? communicationNotes,
    String? initiatesConversation,
    String? maintainsEyeContact,
    String? understandsBodyLanguage,
    String? understandsJokes,
    String? conversationTurnTaking,
  }) =>
      Section6Data(
        communicationMethods: communicationMethods ?? this.communicationMethods,
        communicationMethodOther:
            communicationMethodOther ?? this.communicationMethodOther,
        expressesNeeds: expressesNeeds ?? this.expressesNeeds,
        requestsPreferred: requestsPreferred ?? this.requestsPreferred,
        understandsSimple: understandsSimple ?? this.understandsSimple,
        understandsComplex: understandsComplex ?? this.understandsComplex,
        socialCommTraits: socialCommTraits ?? this.socialCommTraits,
        communicationNotes: communicationNotes ?? this.communicationNotes,
        initiatesConversation:
            initiatesConversation ?? this.initiatesConversation,
        maintainsEyeContact: maintainsEyeContact ?? this.maintainsEyeContact,
        understandsBodyLanguage:
            understandsBodyLanguage ?? this.understandsBodyLanguage,
        understandsJokes: understandsJokes ?? this.understandsJokes,
        conversationTurnTaking:
            conversationTurnTaking ?? this.conversationTurnTaking,
      );

  Map<String, dynamic> toJson() => {
        'communicationMethods': communicationMethods,
        'communicationMethodOther': communicationMethodOther,
        'expressesNeeds': expressesNeeds,
        'requestsPreferred': requestsPreferred,
        'understandsSimple': understandsSimple,
        'understandsComplex': understandsComplex,
        'socialCommTraits': socialCommTraits,
        'communicationNotes': communicationNotes,
        'initiatesConversation': initiatesConversation,
        'maintainsEyeContact': maintainsEyeContact,
        'understandsBodyLanguage': understandsBodyLanguage,
        'understandsJokes': understandsJokes,
        'conversationTurnTaking': conversationTurnTaking,
      };

  factory Section6Data.fromJson(Map<String, dynamic> json) => Section6Data(
        communicationMethods: (json['communicationMethods'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        communicationMethodOther:
            json['communicationMethodOther'] as String? ?? '',
        expressesNeeds: json['expressesNeeds'] as String? ?? '',
        requestsPreferred: json['requestsPreferred'] as String? ?? '',
        understandsSimple: json['understandsSimple'] as String? ?? '',
        understandsComplex: json['understandsComplex'] as String? ?? '',
        socialCommTraits: (json['socialCommTraits'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        communicationNotes: json['communicationNotes'] as String? ?? '',
        initiatesConversation:
            json['initiatesConversation'] as String? ?? '',
        maintainsEyeContact: json['maintainsEyeContact'] as String? ?? '',
        understandsBodyLanguage:
            json['understandsBodyLanguage'] as String? ?? '',
        understandsJokes: json['understandsJokes'] as String? ?? '',
        conversationTurnTaking:
            json['conversationTurnTaking'] as String? ?? '',
      );
}

// =============================================================================
// Section 7 — Daily Life Skills and Independence
// =============================================================================

class Section7Data {
  // Eating & Drinking
  final bool usesSpoonFork;
  final bool selectiveEater;
  final bool usesHandsForEating;
  final bool refusesTextures;
  final bool drinksFromCup;
  final bool needsFullAssistanceEating;
  final String howRequestsFood;

  // Dressing
  final bool removesShoesSocks;
  final bool closesZipperButtons;
  final bool dressesWithAssistance;

  // Personal Hygiene
  final bool washesHandsFace;
  final bool bathesAlone;
  final bool cleansTeetHair;
  final bool nailCuttingDifficulty;

  // Bathroom & Sleep
  final String bathroomIndependence; // 'independent' | 'training' | 'diapers'
  final String howRequestsSleep;

  const Section7Data({
    this.usesSpoonFork = false,
    this.selectiveEater = false,
    this.usesHandsForEating = false,
    this.refusesTextures = false,
    this.drinksFromCup = false,
    this.needsFullAssistanceEating = false,
    this.howRequestsFood = '',
    this.removesShoesSocks = false,
    this.closesZipperButtons = false,
    this.dressesWithAssistance = false,
    this.washesHandsFace = false,
    this.bathesAlone = false,
    this.cleansTeetHair = false,
    this.nailCuttingDifficulty = false,
    this.bathroomIndependence = '',
    this.howRequestsSleep = '',
  });

  Section7Data copyWith({
    bool? usesSpoonFork,
    bool? selectiveEater,
    bool? usesHandsForEating,
    bool? refusesTextures,
    bool? drinksFromCup,
    bool? needsFullAssistanceEating,
    String? howRequestsFood,
    bool? removesShoesSocks,
    bool? closesZipperButtons,
    bool? dressesWithAssistance,
    bool? washesHandsFace,
    bool? bathesAlone,
    bool? cleansTeetHair,
    bool? nailCuttingDifficulty,
    String? bathroomIndependence,
    String? howRequestsSleep,
  }) =>
      Section7Data(
        usesSpoonFork: usesSpoonFork ?? this.usesSpoonFork,
        selectiveEater: selectiveEater ?? this.selectiveEater,
        usesHandsForEating: usesHandsForEating ?? this.usesHandsForEating,
        refusesTextures: refusesTextures ?? this.refusesTextures,
        drinksFromCup: drinksFromCup ?? this.drinksFromCup,
        needsFullAssistanceEating:
            needsFullAssistanceEating ?? this.needsFullAssistanceEating,
        howRequestsFood: howRequestsFood ?? this.howRequestsFood,
        removesShoesSocks: removesShoesSocks ?? this.removesShoesSocks,
        closesZipperButtons: closesZipperButtons ?? this.closesZipperButtons,
        dressesWithAssistance:
            dressesWithAssistance ?? this.dressesWithAssistance,
        washesHandsFace: washesHandsFace ?? this.washesHandsFace,
        bathesAlone: bathesAlone ?? this.bathesAlone,
        cleansTeetHair: cleansTeetHair ?? this.cleansTeetHair,
        nailCuttingDifficulty:
            nailCuttingDifficulty ?? this.nailCuttingDifficulty,
        bathroomIndependence: bathroomIndependence ?? this.bathroomIndependence,
        howRequestsSleep: howRequestsSleep ?? this.howRequestsSleep,
      );

  Map<String, dynamic> toJson() => {
        'usesSpoonFork': usesSpoonFork,
        'selectiveEater': selectiveEater,
        'usesHandsForEating': usesHandsForEating,
        'refusesTextures': refusesTextures,
        'drinksFromCup': drinksFromCup,
        'needsFullAssistanceEating': needsFullAssistanceEating,
        'howRequestsFood': howRequestsFood,
        'removesShoesSocks': removesShoesSocks,
        'closesZipperButtons': closesZipperButtons,
        'dressesWithAssistance': dressesWithAssistance,
        'washesHandsFace': washesHandsFace,
        'bathesAlone': bathesAlone,
        'cleansTeetHair': cleansTeetHair,
        'nailCuttingDifficulty': nailCuttingDifficulty,
        'bathroomIndependence': bathroomIndependence,
        'howRequestsSleep': howRequestsSleep,
      };

  factory Section7Data.fromJson(Map<String, dynamic> json) => Section7Data(
        usesSpoonFork: json['usesSpoonFork'] as bool? ?? false,
        selectiveEater: json['selectiveEater'] as bool? ?? false,
        usesHandsForEating: json['usesHandsForEating'] as bool? ?? false,
        refusesTextures: json['refusesTextures'] as bool? ?? false,
        drinksFromCup: json['drinksFromCup'] as bool? ?? false,
        needsFullAssistanceEating:
            json['needsFullAssistanceEating'] as bool? ?? false,
        howRequestsFood: json['howRequestsFood'] as String? ?? '',
        removesShoesSocks: json['removesShoesSocks'] as bool? ?? false,
        closesZipperButtons: json['closesZipperButtons'] as bool? ?? false,
        dressesWithAssistance: json['dressesWithAssistance'] as bool? ?? false,
        washesHandsFace: json['washesHandsFace'] as bool? ?? false,
        bathesAlone: json['bathesAlone'] as bool? ?? false,
        cleansTeetHair: json['cleansTeetHair'] as bool? ?? false,
        nailCuttingDifficulty: json['nailCuttingDifficulty'] as bool? ?? false,
        bathroomIndependence: json['bathroomIndependence'] as String? ?? '',
        howRequestsSleep: json['howRequestsSleep'] as String? ?? '',
      );
}

// =============================================================================
// Section 8 — Sensory and Behavioral Profile
// =============================================================================

class BehavioralPattern {
  final String pattern;
  final String practices;
  final String expectedFunction;

  const BehavioralPattern({
    this.pattern = '',
    this.practices = '',
    this.expectedFunction = '',
  });

  BehavioralPattern copyWith({
    String? pattern,
    String? practices,
    String? expectedFunction,
  }) =>
      BehavioralPattern(
        pattern: pattern ?? this.pattern,
        practices: practices ?? this.practices,
        expectedFunction: expectedFunction ?? this.expectedFunction,
      );

  Map<String, dynamic> toJson() => {
        'pattern': pattern,
        'practices': practices,
        'expectedFunction': expectedFunction,
      };

  factory BehavioralPattern.fromJson(Map<String, dynamic> json) =>
      BehavioralPattern(
        pattern: json['pattern'] as String? ?? '',
        practices: json['practices'] as String? ?? '',
        expectedFunction: json['expectedFunction'] as String? ?? '',
      );
}

class Section8Data {
  final String aggressionDescription;
  final String selfHarmDescription;
  final String stereotypicalBehaviorsDescription;
  final String resistanceToChangeDescription;
  final String excessiveAttachmentDescription;
  final List<BehavioralPattern> behavioralPatterns;
  final String generalAttentionState;
  final String generalStateNotes;
  final bool? hasSensoryIssues;
  final String sensoryIssuesNotes;
  final bool? hearingIssue;
  final String hearingNotes;
  final bool? touchIssue;
  final String touchNotes;
  final bool? tasteIssue;
  final String tasteNotes;
  final bool? vestibularIssue;
  final String vestibularNotes;
  final bool? visualSensoryIssue;
  final String visualSensoryNotes;
  final String sensoryReactionDescription;
  final bool? makesFriendsEasily;
  final String makesFriendsNotes;
  final bool? sharesInterests;
  final String sharesInterestsNotes;
  final String abuseExposure;
  final String abuseNotes;
  final bool? hasSignificantSocialEvent;
  final String significantSocialEventNotes;
  final String reactionToNegativeBehavior;

  const Section8Data({
    this.aggressionDescription = '',
    this.selfHarmDescription = '',
    this.stereotypicalBehaviorsDescription = '',
    this.resistanceToChangeDescription = '',
    this.excessiveAttachmentDescription = '',
    this.behavioralPatterns = const [],
    this.generalAttentionState = '',
    this.generalStateNotes = '',
    this.hasSensoryIssues,
    this.sensoryIssuesNotes = '',
    this.hearingIssue,
    this.hearingNotes = '',
    this.touchIssue,
    this.touchNotes = '',
    this.tasteIssue,
    this.tasteNotes = '',
    this.vestibularIssue,
    this.vestibularNotes = '',
    this.visualSensoryIssue,
    this.visualSensoryNotes = '',
    this.sensoryReactionDescription = '',
    this.makesFriendsEasily,
    this.makesFriendsNotes = '',
    this.sharesInterests,
    this.sharesInterestsNotes = '',
    this.abuseExposure = '',
    this.abuseNotes = '',
    this.hasSignificantSocialEvent,
    this.significantSocialEventNotes = '',
    this.reactionToNegativeBehavior = '',
  });

  Section8Data copyWith({
    String? aggressionDescription,
    String? selfHarmDescription,
    String? stereotypicalBehaviorsDescription,
    String? resistanceToChangeDescription,
    String? excessiveAttachmentDescription,
    List<BehavioralPattern>? behavioralPatterns,
    String? generalAttentionState,
    String? generalStateNotes,
    bool? hasSensoryIssues,
    String? sensoryIssuesNotes,
    bool? hearingIssue,
    String? hearingNotes,
    bool? touchIssue,
    String? touchNotes,
    bool? tasteIssue,
    String? tasteNotes,
    bool? vestibularIssue,
    String? vestibularNotes,
    bool? visualSensoryIssue,
    String? visualSensoryNotes,
    String? sensoryReactionDescription,
    bool? makesFriendsEasily,
    String? makesFriendsNotes,
    bool? sharesInterests,
    String? sharesInterestsNotes,
    String? abuseExposure,
    String? abuseNotes,
    bool? hasSignificantSocialEvent,
    String? significantSocialEventNotes,
    String? reactionToNegativeBehavior,
  }) =>
      Section8Data(
        aggressionDescription:
            aggressionDescription ?? this.aggressionDescription,
        selfHarmDescription: selfHarmDescription ?? this.selfHarmDescription,
        stereotypicalBehaviorsDescription: stereotypicalBehaviorsDescription ??
            this.stereotypicalBehaviorsDescription,
        resistanceToChangeDescription:
            resistanceToChangeDescription ?? this.resistanceToChangeDescription,
        excessiveAttachmentDescription:
            excessiveAttachmentDescription ?? this.excessiveAttachmentDescription,
        behavioralPatterns: behavioralPatterns ?? this.behavioralPatterns,
        generalAttentionState:
            generalAttentionState ?? this.generalAttentionState,
        generalStateNotes: generalStateNotes ?? this.generalStateNotes,
        hasSensoryIssues: hasSensoryIssues ?? this.hasSensoryIssues,
        sensoryIssuesNotes: sensoryIssuesNotes ?? this.sensoryIssuesNotes,
        hearingIssue: hearingIssue ?? this.hearingIssue,
        hearingNotes: hearingNotes ?? this.hearingNotes,
        touchIssue: touchIssue ?? this.touchIssue,
        touchNotes: touchNotes ?? this.touchNotes,
        tasteIssue: tasteIssue ?? this.tasteIssue,
        tasteNotes: tasteNotes ?? this.tasteNotes,
        vestibularIssue: vestibularIssue ?? this.vestibularIssue,
        vestibularNotes: vestibularNotes ?? this.vestibularNotes,
        visualSensoryIssue: visualSensoryIssue ?? this.visualSensoryIssue,
        visualSensoryNotes: visualSensoryNotes ?? this.visualSensoryNotes,
        sensoryReactionDescription:
            sensoryReactionDescription ?? this.sensoryReactionDescription,
        makesFriendsEasily: makesFriendsEasily ?? this.makesFriendsEasily,
        makesFriendsNotes: makesFriendsNotes ?? this.makesFriendsNotes,
        sharesInterests: sharesInterests ?? this.sharesInterests,
        sharesInterestsNotes:
            sharesInterestsNotes ?? this.sharesInterestsNotes,
        abuseExposure: abuseExposure ?? this.abuseExposure,
        abuseNotes: abuseNotes ?? this.abuseNotes,
        hasSignificantSocialEvent:
            hasSignificantSocialEvent ?? this.hasSignificantSocialEvent,
        significantSocialEventNotes:
            significantSocialEventNotes ?? this.significantSocialEventNotes,
        reactionToNegativeBehavior:
            reactionToNegativeBehavior ?? this.reactionToNegativeBehavior,
      );

  Map<String, dynamic> toJson() => {
        'aggressionDescription': aggressionDescription,
        'selfHarmDescription': selfHarmDescription,
        'stereotypicalBehaviorsDescription': stereotypicalBehaviorsDescription,
        'resistanceToChangeDescription': resistanceToChangeDescription,
        'excessiveAttachmentDescription': excessiveAttachmentDescription,
        'behavioralPatterns':
            behavioralPatterns.map((e) => e.toJson()).toList(),
        'generalAttentionState': generalAttentionState,
        'generalStateNotes': generalStateNotes,
        'hasSensoryIssues': hasSensoryIssues,
        'sensoryIssuesNotes': sensoryIssuesNotes,
        'hearingIssue': hearingIssue,
        'hearingNotes': hearingNotes,
        'touchIssue': touchIssue,
        'touchNotes': touchNotes,
        'tasteIssue': tasteIssue,
        'tasteNotes': tasteNotes,
        'vestibularIssue': vestibularIssue,
        'vestibularNotes': vestibularNotes,
        'visualSensoryIssue': visualSensoryIssue,
        'visualSensoryNotes': visualSensoryNotes,
        'sensoryReactionDescription': sensoryReactionDescription,
        'makesFriendsEasily': makesFriendsEasily,
        'makesFriendsNotes': makesFriendsNotes,
        'sharesInterests': sharesInterests,
        'sharesInterestsNotes': sharesInterestsNotes,
        'abuseExposure': abuseExposure,
        'abuseNotes': abuseNotes,
        'hasSignificantSocialEvent': hasSignificantSocialEvent,
        'significantSocialEventNotes': significantSocialEventNotes,
        'reactionToNegativeBehavior': reactionToNegativeBehavior,
      };

  factory Section8Data.fromJson(Map<String, dynamic> json) => Section8Data(
        aggressionDescription:
            json['aggressionDescription'] as String? ?? '',
        selfHarmDescription: json['selfHarmDescription'] as String? ?? '',
        stereotypicalBehaviorsDescription:
            json['stereotypicalBehaviorsDescription'] as String? ?? '',
        resistanceToChangeDescription:
            json['resistanceToChangeDescription'] as String? ?? '',
        excessiveAttachmentDescription:
            json['excessiveAttachmentDescription'] as String? ?? '',
        behavioralPatterns: (json['behavioralPatterns'] as List<dynamic>? ?? [])
            .map((e) => BehavioralPattern.fromJson(e as Map<String, dynamic>))
            .toList(),
        generalAttentionState:
            json['generalAttentionState'] as String? ?? '',
        generalStateNotes: json['generalStateNotes'] as String? ?? '',
        hasSensoryIssues: json['hasSensoryIssues'] as bool?,
        sensoryIssuesNotes: json['sensoryIssuesNotes'] as String? ?? '',
        hearingIssue: json['hearingIssue'] as bool?,
        hearingNotes: json['hearingNotes'] as String? ?? '',
        touchIssue: json['touchIssue'] as bool?,
        touchNotes: json['touchNotes'] as String? ?? '',
        tasteIssue: json['tasteIssue'] as bool?,
        tasteNotes: json['tasteNotes'] as String? ?? '',
        vestibularIssue: json['vestibularIssue'] as bool?,
        vestibularNotes: json['vestibularNotes'] as String? ?? '',
        visualSensoryIssue: json['visualSensoryIssue'] as bool?,
        visualSensoryNotes: json['visualSensoryNotes'] as String? ?? '',
        sensoryReactionDescription:
            json['sensoryReactionDescription'] as String? ?? '',
        makesFriendsEasily: json['makesFriendsEasily'] as bool?,
        makesFriendsNotes: json['makesFriendsNotes'] as String? ?? '',
        sharesInterests: json['sharesInterests'] as bool?,
        sharesInterestsNotes: json['sharesInterestsNotes'] as String? ?? '',
        abuseExposure: json['abuseExposure'] as String? ?? '',
        abuseNotes: json['abuseNotes'] as String? ?? '',
        hasSignificantSocialEvent: json['hasSignificantSocialEvent'] as bool?,
        significantSocialEventNotes:
            json['significantSocialEventNotes'] as String? ?? '',
        reactionToNegativeBehavior:
            json['reactionToNegativeBehavior'] as String? ?? '',
      );
}

// =============================================================================
// Section 9 — Capabilities, Strengths, and Interests
// =============================================================================

class Section9Data {
  final String observedStrengths;
  final bool activitySensoryGames;
  final bool activityElectronics;
  final bool activityMotor;
  final bool activityFoods;
  final bool activityCharacters;
  final bool activityMusic;
  final bool activityOther;
  final String otherActivitiesDescription;
  final String foodExample;
  final String foodRating;
  final String sensoryExample;
  final String sensoryRating;
  final String socialExample;
  final String socialRating;
  final String materialExample;
  final String materialRating;
  final String positiveDistinction;

  const Section9Data({
    this.observedStrengths = '',
    this.activitySensoryGames = false,
    this.activityElectronics = false,
    this.activityMotor = false,
    this.activityFoods = false,
    this.activityCharacters = false,
    this.activityMusic = false,
    this.activityOther = false,
    this.otherActivitiesDescription = '',
    this.foodExample = '',
    this.foodRating = '',
    this.sensoryExample = '',
    this.sensoryRating = '',
    this.socialExample = '',
    this.socialRating = '',
    this.materialExample = '',
    this.materialRating = '',
    this.positiveDistinction = '',
  });

  Section9Data copyWith({
    String? observedStrengths,
    bool? activitySensoryGames,
    bool? activityElectronics,
    bool? activityMotor,
    bool? activityFoods,
    bool? activityCharacters,
    bool? activityMusic,
    bool? activityOther,
    String? otherActivitiesDescription,
    String? foodExample,
    String? foodRating,
    String? sensoryExample,
    String? sensoryRating,
    String? socialExample,
    String? socialRating,
    String? materialExample,
    String? materialRating,
    String? positiveDistinction,
  }) =>
      Section9Data(
        observedStrengths: observedStrengths ?? this.observedStrengths,
        activitySensoryGames: activitySensoryGames ?? this.activitySensoryGames,
        activityElectronics: activityElectronics ?? this.activityElectronics,
        activityMotor: activityMotor ?? this.activityMotor,
        activityFoods: activityFoods ?? this.activityFoods,
        activityCharacters: activityCharacters ?? this.activityCharacters,
        activityMusic: activityMusic ?? this.activityMusic,
        activityOther: activityOther ?? this.activityOther,
        otherActivitiesDescription:
            otherActivitiesDescription ?? this.otherActivitiesDescription,
        foodExample: foodExample ?? this.foodExample,
        foodRating: foodRating ?? this.foodRating,
        sensoryExample: sensoryExample ?? this.sensoryExample,
        sensoryRating: sensoryRating ?? this.sensoryRating,
        socialExample: socialExample ?? this.socialExample,
        socialRating: socialRating ?? this.socialRating,
        materialExample: materialExample ?? this.materialExample,
        materialRating: materialRating ?? this.materialRating,
        positiveDistinction: positiveDistinction ?? this.positiveDistinction,
      );

  Map<String, dynamic> toJson() => {
        'observedStrengths': observedStrengths,
        'activitySensoryGames': activitySensoryGames,
        'activityElectronics': activityElectronics,
        'activityMotor': activityMotor,
        'activityFoods': activityFoods,
        'activityCharacters': activityCharacters,
        'activityMusic': activityMusic,
        'activityOther': activityOther,
        'otherActivitiesDescription': otherActivitiesDescription,
        'foodExample': foodExample,
        'foodRating': foodRating,
        'sensoryExample': sensoryExample,
        'sensoryRating': sensoryRating,
        'socialExample': socialExample,
        'socialRating': socialRating,
        'materialExample': materialExample,
        'materialRating': materialRating,
        'positiveDistinction': positiveDistinction,
      };

  factory Section9Data.fromJson(Map<String, dynamic> json) => Section9Data(
        observedStrengths: json['observedStrengths'] as String? ?? '',
        activitySensoryGames: json['activitySensoryGames'] as bool? ?? false,
        activityElectronics: json['activityElectronics'] as bool? ?? false,
        activityMotor: json['activityMotor'] as bool? ?? false,
        activityFoods: json['activityFoods'] as bool? ?? false,
        activityCharacters: json['activityCharacters'] as bool? ?? false,
        activityMusic: json['activityMusic'] as bool? ?? false,
        activityOther: json['activityOther'] as bool? ?? false,
        otherActivitiesDescription:
            json['otherActivitiesDescription'] as String? ?? '',
        foodExample: json['foodExample'] as String? ?? '',
        foodRating: json['foodRating'] as String? ?? '',
        sensoryExample: json['sensoryExample'] as String? ?? '',
        sensoryRating: json['sensoryRating'] as String? ?? '',
        socialExample: json['socialExample'] as String? ?? '',
        socialRating: json['socialRating'] as String? ?? '',
        materialExample: json['materialExample'] as String? ?? '',
        materialRating: json['materialRating'] as String? ?? '',
        positiveDistinction: json['positiveDistinction'] as String? ?? '',
      );
}

// =============================================================================
// Section 10 — Educational and Services
// =============================================================================

class Section10Data {
  final bool? isEnrolledInSchool;
  final String schoolName;
  final String schoolGrade;
  final bool serviceABA;
  final bool serviceSpeech;
  final bool serviceOccupational;
  final bool servicePhysical;
  final bool servicePsychological;
  final bool serviceSpecialEd;
  final bool serviceOther;
  final bool serviceNone;
  final String otherServiceDescription;
  final String serviceDuration;
  final bool? hasIEP;
  final bool reportVineland;
  final bool reportEFL;
  final bool reportAFLS;
  final bool reportABLLS;
  final bool reportVBMAPP;
  final bool reportOther;
  final bool reportNone;
  final String classType;
  final bool? hasShadowTeacher;
  final String shadowTeacherName;
  final bool modReduceDistractions;
  final bool modVisualSchedule;
  final bool modSpecificSeat;
  final bool modOther;
  final String schoolBehavior;

  const Section10Data({
    this.isEnrolledInSchool,
    this.schoolName = '',
    this.schoolGrade = '',
    this.serviceABA = false,
    this.serviceSpeech = false,
    this.serviceOccupational = false,
    this.servicePhysical = false,
    this.servicePsychological = false,
    this.serviceSpecialEd = false,
    this.serviceOther = false,
    this.serviceNone = false,
    this.otherServiceDescription = '',
    this.serviceDuration = '',
    this.hasIEP,
    this.reportVineland = false,
    this.reportEFL = false,
    this.reportAFLS = false,
    this.reportABLLS = false,
    this.reportVBMAPP = false,
    this.reportOther = false,
    this.reportNone = false,
    this.classType = '',
    this.hasShadowTeacher,
    this.shadowTeacherName = '',
    this.modReduceDistractions = false,
    this.modVisualSchedule = false,
    this.modSpecificSeat = false,
    this.modOther = false,
    this.schoolBehavior = '',
  });

  Section10Data copyWith({
    bool? isEnrolledInSchool,
    String? schoolName,
    String? schoolGrade,
    bool? serviceABA,
    bool? serviceSpeech,
    bool? serviceOccupational,
    bool? servicePhysical,
    bool? servicePsychological,
    bool? serviceSpecialEd,
    bool? serviceOther,
    bool? serviceNone,
    String? otherServiceDescription,
    String? serviceDuration,
    bool? hasIEP,
    bool? reportVineland,
    bool? reportEFL,
    bool? reportAFLS,
    bool? reportABLLS,
    bool? reportVBMAPP,
    bool? reportOther,
    bool? reportNone,
    String? classType,
    bool? hasShadowTeacher,
    String? shadowTeacherName,
    bool? modReduceDistractions,
    bool? modVisualSchedule,
    bool? modSpecificSeat,
    bool? modOther,
    String? schoolBehavior,
  }) =>
      Section10Data(
        isEnrolledInSchool: isEnrolledInSchool ?? this.isEnrolledInSchool,
        schoolName: schoolName ?? this.schoolName,
        schoolGrade: schoolGrade ?? this.schoolGrade,
        serviceABA: serviceABA ?? this.serviceABA,
        serviceSpeech: serviceSpeech ?? this.serviceSpeech,
        serviceOccupational: serviceOccupational ?? this.serviceOccupational,
        servicePhysical: servicePhysical ?? this.servicePhysical,
        servicePsychological: servicePsychological ?? this.servicePsychological,
        serviceSpecialEd: serviceSpecialEd ?? this.serviceSpecialEd,
        serviceOther: serviceOther ?? this.serviceOther,
        serviceNone: serviceNone ?? this.serviceNone,
        otherServiceDescription:
            otherServiceDescription ?? this.otherServiceDescription,
        serviceDuration: serviceDuration ?? this.serviceDuration,
        hasIEP: hasIEP ?? this.hasIEP,
        reportVineland: reportVineland ?? this.reportVineland,
        reportEFL: reportEFL ?? this.reportEFL,
        reportAFLS: reportAFLS ?? this.reportAFLS,
        reportABLLS: reportABLLS ?? this.reportABLLS,
        reportVBMAPP: reportVBMAPP ?? this.reportVBMAPP,
        reportOther: reportOther ?? this.reportOther,
        reportNone: reportNone ?? this.reportNone,
        classType: classType ?? this.classType,
        hasShadowTeacher: hasShadowTeacher ?? this.hasShadowTeacher,
        shadowTeacherName: shadowTeacherName ?? this.shadowTeacherName,
        modReduceDistractions:
            modReduceDistractions ?? this.modReduceDistractions,
        modVisualSchedule: modVisualSchedule ?? this.modVisualSchedule,
        modSpecificSeat: modSpecificSeat ?? this.modSpecificSeat,
        modOther: modOther ?? this.modOther,
        schoolBehavior: schoolBehavior ?? this.schoolBehavior,
      );

  Map<String, dynamic> toJson() => {
        'isEnrolledInSchool': isEnrolledInSchool,
        'schoolName': schoolName,
        'schoolGrade': schoolGrade,
        'serviceABA': serviceABA,
        'serviceSpeech': serviceSpeech,
        'serviceOccupational': serviceOccupational,
        'servicePhysical': servicePhysical,
        'servicePsychological': servicePsychological,
        'serviceSpecialEd': serviceSpecialEd,
        'serviceOther': serviceOther,
        'serviceNone': serviceNone,
        'otherServiceDescription': otherServiceDescription,
        'serviceDuration': serviceDuration,
        'hasIEP': hasIEP,
        'reportVineland': reportVineland,
        'reportEFL': reportEFL,
        'reportAFLS': reportAFLS,
        'reportABLLS': reportABLLS,
        'reportVBMAPP': reportVBMAPP,
        'reportOther': reportOther,
        'reportNone': reportNone,
        'classType': classType,
        'hasShadowTeacher': hasShadowTeacher,
        'shadowTeacherName': shadowTeacherName,
        'modReduceDistractions': modReduceDistractions,
        'modVisualSchedule': modVisualSchedule,
        'modSpecificSeat': modSpecificSeat,
        'modOther': modOther,
        'schoolBehavior': schoolBehavior,
      };

  factory Section10Data.fromJson(Map<String, dynamic> json) => Section10Data(
        isEnrolledInSchool: json['isEnrolledInSchool'] as bool?,
        schoolName: json['schoolName'] as String? ?? '',
        schoolGrade: json['schoolGrade'] as String? ?? '',
        serviceABA: json['serviceABA'] as bool? ?? false,
        serviceSpeech: json['serviceSpeech'] as bool? ?? false,
        serviceOccupational: json['serviceOccupational'] as bool? ?? false,
        servicePhysical: json['servicePhysical'] as bool? ?? false,
        servicePsychological: json['servicePsychological'] as bool? ?? false,
        serviceSpecialEd: json['serviceSpecialEd'] as bool? ?? false,
        serviceOther: json['serviceOther'] as bool? ?? false,
        serviceNone: json['serviceNone'] as bool? ?? false,
        otherServiceDescription:
            json['otherServiceDescription'] as String? ?? '',
        serviceDuration: json['serviceDuration'] as String? ?? '',
        hasIEP: json['hasIEP'] as bool?,
        reportVineland: json['reportVineland'] as bool? ?? false,
        reportEFL: json['reportEFL'] as bool? ?? false,
        reportAFLS: json['reportAFLS'] as bool? ?? false,
        reportABLLS: json['reportABLLS'] as bool? ?? false,
        reportVBMAPP: json['reportVBMAPP'] as bool? ?? false,
        reportOther: json['reportOther'] as bool? ?? false,
        reportNone: json['reportNone'] as bool? ?? false,
        classType: json['classType'] as String? ?? '',
        hasShadowTeacher: json['hasShadowTeacher'] as bool?,
        shadowTeacherName: json['shadowTeacherName'] as String? ?? '',
        modReduceDistractions: json['modReduceDistractions'] as bool? ?? false,
        modVisualSchedule: json['modVisualSchedule'] as bool? ?? false,
        modSpecificSeat: json['modSpecificSeat'] as bool? ?? false,
        modOther: json['modOther'] as bool? ?? false,
        schoolBehavior: json['schoolBehavior'] as String? ?? '',
      );
}

// =============================================================================
// Section 11 — Family Priorities and Goals
// =============================================================================

class Section11Data {
  final String topConcerns;
  final String topGoals;
  final String sessionTimePreferences;
  final String parentTrainingReadiness;

  const Section11Data({
    this.topConcerns = '',
    this.topGoals = '',
    this.sessionTimePreferences = '',
    this.parentTrainingReadiness = '',
  });

  Section11Data copyWith({
    String? topConcerns,
    String? topGoals,
    String? sessionTimePreferences,
    String? parentTrainingReadiness,
  }) =>
      Section11Data(
        topConcerns: topConcerns ?? this.topConcerns,
        topGoals: topGoals ?? this.topGoals,
        sessionTimePreferences:
            sessionTimePreferences ?? this.sessionTimePreferences,
        parentTrainingReadiness:
            parentTrainingReadiness ?? this.parentTrainingReadiness,
      );

  Map<String, dynamic> toJson() => {
        'topConcerns': topConcerns,
        'topGoals': topGoals,
        'sessionTimePreferences': sessionTimePreferences,
        'parentTrainingReadiness': parentTrainingReadiness,
      };

  factory Section11Data.fromJson(Map<String, dynamic> json) => Section11Data(
        topConcerns: json['topConcerns'] as String? ?? '',
        topGoals: json['topGoals'] as String? ?? '',
        sessionTimePreferences:
            json['sessionTimePreferences'] as String? ?? '',
        parentTrainingReadiness:
            json['parentTrainingReadiness'] as String? ?? '',
      );
}

// =============================================================================
// Section 12 — Developmental Growth (Educational Aspects)
// =============================================================================

class Section12Data {
  final String learningReadinessLevel; // 'good' | 'average' | 'weak'
  final bool? absentFromCenter;
  final String absenceDuration;
  final String absenceReason;
  final bool? participatesInActivities;
  final bool? likesCenter;
  final bool? tiresFastInClass;
  final String teacherRelationship; // 'good' | 'bad'
  final String peersRelationship; // 'good' | 'bad'
  final String comprehensionLevel; // 'good' | 'average' | 'weak' | 'none'
  // Name recognition
  final bool? knowsFriendsNames;
  final bool? knowsTeachersNames;
  final bool? knowsClassChildren;
  // Expression
  final bool? usesSentences;
  final bool? usesVerbs;
  final bool? usesConnectors;
  // Body awareness
  final bool? bodyImage;
  final bool? bodyDirection;
  // Auditory perception
  final bool? soundDirection;
  final bool? animalSounds;
  // Visual perception
  final bool? recognizesDifferences;
  final bool? recognizesSimilarities;
  final bool? colorConcept;
  final bool? shapeConcept;

  const Section12Data({
    this.learningReadinessLevel = '',
    this.absentFromCenter,
    this.absenceDuration = '',
    this.absenceReason = '',
    this.participatesInActivities,
    this.likesCenter,
    this.tiresFastInClass,
    this.teacherRelationship = '',
    this.peersRelationship = '',
    this.comprehensionLevel = '',
    this.knowsFriendsNames,
    this.knowsTeachersNames,
    this.knowsClassChildren,
    this.usesSentences,
    this.usesVerbs,
    this.usesConnectors,
    this.bodyImage,
    this.bodyDirection,
    this.soundDirection,
    this.animalSounds,
    this.recognizesDifferences,
    this.recognizesSimilarities,
    this.colorConcept,
    this.shapeConcept,
  });

  Section12Data copyWith({
    String? learningReadinessLevel,
    bool? absentFromCenter,
    String? absenceDuration,
    String? absenceReason,
    bool? participatesInActivities,
    bool? likesCenter,
    bool? tiresFastInClass,
    String? teacherRelationship,
    String? peersRelationship,
    String? comprehensionLevel,
    bool? knowsFriendsNames,
    bool? knowsTeachersNames,
    bool? knowsClassChildren,
    bool? usesSentences,
    bool? usesVerbs,
    bool? usesConnectors,
    bool? bodyImage,
    bool? bodyDirection,
    bool? soundDirection,
    bool? animalSounds,
    bool? recognizesDifferences,
    bool? recognizesSimilarities,
    bool? colorConcept,
    bool? shapeConcept,
  }) =>
      Section12Data(
        learningReadinessLevel:
            learningReadinessLevel ?? this.learningReadinessLevel,
        absentFromCenter: absentFromCenter ?? this.absentFromCenter,
        absenceDuration: absenceDuration ?? this.absenceDuration,
        absenceReason: absenceReason ?? this.absenceReason,
        participatesInActivities:
            participatesInActivities ?? this.participatesInActivities,
        likesCenter: likesCenter ?? this.likesCenter,
        tiresFastInClass: tiresFastInClass ?? this.tiresFastInClass,
        teacherRelationship: teacherRelationship ?? this.teacherRelationship,
        peersRelationship: peersRelationship ?? this.peersRelationship,
        comprehensionLevel: comprehensionLevel ?? this.comprehensionLevel,
        knowsFriendsNames: knowsFriendsNames ?? this.knowsFriendsNames,
        knowsTeachersNames: knowsTeachersNames ?? this.knowsTeachersNames,
        knowsClassChildren: knowsClassChildren ?? this.knowsClassChildren,
        usesSentences: usesSentences ?? this.usesSentences,
        usesVerbs: usesVerbs ?? this.usesVerbs,
        usesConnectors: usesConnectors ?? this.usesConnectors,
        bodyImage: bodyImage ?? this.bodyImage,
        bodyDirection: bodyDirection ?? this.bodyDirection,
        soundDirection: soundDirection ?? this.soundDirection,
        animalSounds: animalSounds ?? this.animalSounds,
        recognizesDifferences:
            recognizesDifferences ?? this.recognizesDifferences,
        recognizesSimilarities:
            recognizesSimilarities ?? this.recognizesSimilarities,
        colorConcept: colorConcept ?? this.colorConcept,
        shapeConcept: shapeConcept ?? this.shapeConcept,
      );

  Map<String, dynamic> toJson() => {
        'learningReadinessLevel': learningReadinessLevel,
        'absentFromCenter': absentFromCenter,
        'absenceDuration': absenceDuration,
        'absenceReason': absenceReason,
        'participatesInActivities': participatesInActivities,
        'likesCenter': likesCenter,
        'tiresFastInClass': tiresFastInClass,
        'teacherRelationship': teacherRelationship,
        'peersRelationship': peersRelationship,
        'comprehensionLevel': comprehensionLevel,
        'knowsFriendsNames': knowsFriendsNames,
        'knowsTeachersNames': knowsTeachersNames,
        'knowsClassChildren': knowsClassChildren,
        'usesSentences': usesSentences,
        'usesVerbs': usesVerbs,
        'usesConnectors': usesConnectors,
        'bodyImage': bodyImage,
        'bodyDirection': bodyDirection,
        'soundDirection': soundDirection,
        'animalSounds': animalSounds,
        'recognizesDifferences': recognizesDifferences,
        'recognizesSimilarities': recognizesSimilarities,
        'colorConcept': colorConcept,
        'shapeConcept': shapeConcept,
      };

  factory Section12Data.fromJson(Map<String, dynamic> json) => Section12Data(
        learningReadinessLevel:
            json['learningReadinessLevel'] as String? ?? '',
        absentFromCenter: json['absentFromCenter'] as bool?,
        absenceDuration: json['absenceDuration'] as String? ?? '',
        absenceReason: json['absenceReason'] as String? ?? '',
        participatesInActivities: json['participatesInActivities'] as bool?,
        likesCenter: json['likesCenter'] as bool?,
        tiresFastInClass: json['tiresFastInClass'] as bool?,
        teacherRelationship: json['teacherRelationship'] as String? ?? '',
        peersRelationship: json['peersRelationship'] as String? ?? '',
        comprehensionLevel: json['comprehensionLevel'] as String? ?? '',
        knowsFriendsNames: json['knowsFriendsNames'] as bool?,
        knowsTeachersNames: json['knowsTeachersNames'] as bool?,
        knowsClassChildren: json['knowsClassChildren'] as bool?,
        usesSentences: json['usesSentences'] as bool?,
        usesVerbs: json['usesVerbs'] as bool?,
        usesConnectors: json['usesConnectors'] as bool?,
        bodyImage: json['bodyImage'] as bool?,
        bodyDirection: json['bodyDirection'] as bool?,
        soundDirection: json['soundDirection'] as bool?,
        animalSounds: json['animalSounds'] as bool?,
        recognizesDifferences: json['recognizesDifferences'] as bool?,
        recognizesSimilarities: json['recognizesSimilarities'] as bool?,
        colorConcept: json['colorConcept'] as bool?,
        shapeConcept: json['shapeConcept'] as bool?,
      );
}

// =============================================================================
// Section 13 — Initial Assessment and Follow-up Plan
// =============================================================================

class Section13Data {
  final String priorityLevel; // 'low'|'medium'|'high'|'urgent'

  final bool specABA;
  final bool specSpeech;
  final bool specOccupational;
  final bool specPhysical;
  final bool specPsychological;
  final bool specSpecialEd;

  final bool? reviewOtherReports;
  final bool? directObservation;
  final bool? familyMeeting;

  final String notesAndNextSteps;
  final DateTime? nextAssessmentDate;
  final String nextAssessmentTime; // "HH:mm"

  const Section13Data({
    this.priorityLevel = '',
    this.specABA = false,
    this.specSpeech = false,
    this.specOccupational = false,
    this.specPhysical = false,
    this.specPsychological = false,
    this.specSpecialEd = false,
    this.reviewOtherReports,
    this.directObservation,
    this.familyMeeting,
    this.notesAndNextSteps = '',
    this.nextAssessmentDate,
    this.nextAssessmentTime = '',
  });

  Section13Data copyWith({
    String? priorityLevel,
    bool? specABA,
    bool? specSpeech,
    bool? specOccupational,
    bool? specPhysical,
    bool? specPsychological,
    bool? specSpecialEd,
    bool? reviewOtherReports,
    bool? directObservation,
    bool? familyMeeting,
    String? notesAndNextSteps,
    DateTime? nextAssessmentDate,
    bool clearNextAssessmentDate = false,
    String? nextAssessmentTime,
  }) =>
      Section13Data(
        priorityLevel: priorityLevel ?? this.priorityLevel,
        specABA: specABA ?? this.specABA,
        specSpeech: specSpeech ?? this.specSpeech,
        specOccupational: specOccupational ?? this.specOccupational,
        specPhysical: specPhysical ?? this.specPhysical,
        specPsychological: specPsychological ?? this.specPsychological,
        specSpecialEd: specSpecialEd ?? this.specSpecialEd,
        reviewOtherReports: reviewOtherReports ?? this.reviewOtherReports,
        directObservation: directObservation ?? this.directObservation,
        familyMeeting: familyMeeting ?? this.familyMeeting,
        notesAndNextSteps: notesAndNextSteps ?? this.notesAndNextSteps,
        nextAssessmentDate: clearNextAssessmentDate
            ? null
            : (nextAssessmentDate ?? this.nextAssessmentDate),
        nextAssessmentTime: nextAssessmentTime ?? this.nextAssessmentTime,
      );

  Map<String, dynamic> toJson() => {
        'priorityLevel': priorityLevel,
        'specABA': specABA,
        'specSpeech': specSpeech,
        'specOccupational': specOccupational,
        'specPhysical': specPhysical,
        'specPsychological': specPsychological,
        'specSpecialEd': specSpecialEd,
        'reviewOtherReports': reviewOtherReports,
        'directObservation': directObservation,
        'familyMeeting': familyMeeting,
        'notesAndNextSteps': notesAndNextSteps,
        'nextAssessmentDate': nextAssessmentDate?.toIso8601String(),
        'nextAssessmentTime': nextAssessmentTime,
      };

  factory Section13Data.fromJson(Map<String, dynamic> json) => Section13Data(
        priorityLevel: json['priorityLevel'] as String? ?? '',
        specABA: json['specABA'] as bool? ?? false,
        specSpeech: json['specSpeech'] as bool? ?? false,
        specOccupational: json['specOccupational'] as bool? ?? false,
        specPhysical: json['specPhysical'] as bool? ?? false,
        specPsychological: json['specPsychological'] as bool? ?? false,
        specSpecialEd: json['specSpecialEd'] as bool? ?? false,
        reviewOtherReports: json['reviewOtherReports'] as bool?,
        directObservation: json['directObservation'] as bool?,
        familyMeeting: json['familyMeeting'] as bool?,
        notesAndNextSteps: json['notesAndNextSteps'] as String? ?? '',
        nextAssessmentDate: json['nextAssessmentDate'] != null
            ? DateTime.tryParse(json['nextAssessmentDate'] as String)
            : null,
        nextAssessmentTime: json['nextAssessmentTime'] as String? ?? '',
      );
}

// =============================================================================
// Section – Documents and Consents
// =============================================================================

class SectionDocumentsConsentData {
  final bool docID;
  final bool docMedicalReports;
  final bool docDiagnosticReports;
  final bool docSchoolReports;
  final bool docPrevTreatmentReports;
  final bool docOther;
  final String docOtherName;
  final bool consentPrivacy;
  final bool consentInfoSharing;
  final bool consentOtherComms;
  final bool consentAssessments;
  final bool consentFuturePlan;

  const SectionDocumentsConsentData({
    this.docID = false,
    this.docMedicalReports = false,
    this.docDiagnosticReports = false,
    this.docSchoolReports = false,
    this.docPrevTreatmentReports = false,
    this.docOther = false,
    this.docOtherName = '',
    this.consentPrivacy = false,
    this.consentInfoSharing = false,
    this.consentOtherComms = false,
    this.consentAssessments = false,
    this.consentFuturePlan = false,
  });

  SectionDocumentsConsentData copyWith({
    bool? docID,
    bool? docMedicalReports,
    bool? docDiagnosticReports,
    bool? docSchoolReports,
    bool? docPrevTreatmentReports,
    bool? docOther,
    String? docOtherName,
    bool? consentPrivacy,
    bool? consentInfoSharing,
    bool? consentOtherComms,
    bool? consentAssessments,
    bool? consentFuturePlan,
  }) =>
      SectionDocumentsConsentData(
        docID: docID ?? this.docID,
        docMedicalReports: docMedicalReports ?? this.docMedicalReports,
        docDiagnosticReports: docDiagnosticReports ?? this.docDiagnosticReports,
        docSchoolReports: docSchoolReports ?? this.docSchoolReports,
        docPrevTreatmentReports:
            docPrevTreatmentReports ?? this.docPrevTreatmentReports,
        docOther: docOther ?? this.docOther,
        docOtherName: docOtherName ?? this.docOtherName,
        consentPrivacy: consentPrivacy ?? this.consentPrivacy,
        consentInfoSharing: consentInfoSharing ?? this.consentInfoSharing,
        consentOtherComms: consentOtherComms ?? this.consentOtherComms,
        consentAssessments: consentAssessments ?? this.consentAssessments,
        consentFuturePlan: consentFuturePlan ?? this.consentFuturePlan,
      );

  Map<String, dynamic> toJson() => {
        'docID': docID,
        'docMedicalReports': docMedicalReports,
        'docDiagnosticReports': docDiagnosticReports,
        'docSchoolReports': docSchoolReports,
        'docPrevTreatmentReports': docPrevTreatmentReports,
        'docOther': docOther,
        'docOtherName': docOtherName,
        'consentPrivacy': consentPrivacy,
        'consentInfoSharing': consentInfoSharing,
        'consentOtherComms': consentOtherComms,
        'consentAssessments': consentAssessments,
        'consentFuturePlan': consentFuturePlan,
      };

  factory SectionDocumentsConsentData.fromJson(Map<String, dynamic> json) =>
      SectionDocumentsConsentData(
        docID: json['docID'] as bool? ?? false,
        docMedicalReports: json['docMedicalReports'] as bool? ?? false,
        docDiagnosticReports: json['docDiagnosticReports'] as bool? ?? false,
        docSchoolReports: json['docSchoolReports'] as bool? ?? false,
        docPrevTreatmentReports:
            json['docPrevTreatmentReports'] as bool? ?? false,
        docOther: json['docOther'] as bool? ?? false,
        docOtherName: json['docOtherName'] as String? ?? '',
        consentPrivacy: json['consentPrivacy'] as bool? ?? false,
        consentInfoSharing: json['consentInfoSharing'] as bool? ?? false,
        consentOtherComms: json['consentOtherComms'] as bool? ?? false,
        consentAssessments: json['consentAssessments'] as bool? ?? false,
        consentFuturePlan: json['consentFuturePlan'] as bool? ?? false,
      );
}

// =============================================================================
// Signature helpers
// =============================================================================

/// Pure-Dart serializable signature data (list of strokes, each stroke a list
/// of {x, y} points). The widget layer converts to/from [dart:ui Offset].
class SignatureData {
  final List<List<Map<String, double>>> strokes;

  const SignatureData({this.strokes = const []});

  bool get isEmpty => strokes.isEmpty;

  List<dynamic> toJson() => strokes
      .map((s) => s.map((p) => {'x': p['x']!, 'y': p['y']!}).toList())
      .toList();

  factory SignatureData.fromJson(dynamic json) {
    if (json == null || json is! List) return const SignatureData();
    return SignatureData(
      strokes: json.map((s) {
        return (s as List<dynamic>).map((p) {
          final m = p as Map;
          return <String, double>{
            'x': (m['x'] as num).toDouble(),
            'y': (m['y'] as num).toDouble(),
          };
        }).toList();
      }).toList(),
    );
  }
}

// =============================================================================
// Section 15 — Signatures
// =============================================================================

class TeamMemberData {
  final String specialization;
  final String name;
  final SignatureData signature;

  const TeamMemberData({
    this.specialization = '',
    this.name = '',
    this.signature = const SignatureData(),
  });

  TeamMemberData copyWith({
    String? specialization,
    String? name,
    SignatureData? signature,
  }) =>
      TeamMemberData(
        specialization: specialization ?? this.specialization,
        name: name ?? this.name,
        signature: signature ?? this.signature,
      );

  Map<String, dynamic> toJson() => {
        'specialization': specialization,
        'name': name,
        'signature': signature.toJson(),
      };

  factory TeamMemberData.fromJson(Map<String, dynamic> json) => TeamMemberData(
        specialization: json['specialization'] as String? ?? '',
        name: json['name'] as String? ?? '',
        signature: SignatureData.fromJson(json['signature']),
      );
}

class Section15Data {
  final String guardianName;
  final SignatureData guardianSignature;
  final DateTime? guardianDate;
  final String specialistName;
  final String specialistJobTitle;
  final SignatureData specialistSignature;
  final DateTime? specialistDate;
  final List<TeamMemberData> teamMembers;

  const Section15Data({
    this.guardianName = '',
    this.guardianSignature = const SignatureData(),
    this.guardianDate,
    this.specialistName = '',
    this.specialistJobTitle = '',
    this.specialistSignature = const SignatureData(),
    this.specialistDate,
    this.teamMembers = const [],
  });

  Section15Data copyWith({
    String? guardianName,
    SignatureData? guardianSignature,
    DateTime? guardianDate,
    bool clearGuardianDate = false,
    String? specialistName,
    String? specialistJobTitle,
    SignatureData? specialistSignature,
    DateTime? specialistDate,
    bool clearSpecialistDate = false,
    List<TeamMemberData>? teamMembers,
  }) =>
      Section15Data(
        guardianName: guardianName ?? this.guardianName,
        guardianSignature: guardianSignature ?? this.guardianSignature,
        guardianDate: clearGuardianDate
            ? null
            : (guardianDate ?? this.guardianDate),
        specialistName: specialistName ?? this.specialistName,
        specialistJobTitle: specialistJobTitle ?? this.specialistJobTitle,
        specialistSignature: specialistSignature ?? this.specialistSignature,
        specialistDate: clearSpecialistDate
            ? null
            : (specialistDate ?? this.specialistDate),
        teamMembers: teamMembers ?? this.teamMembers,
      );

  Map<String, dynamic> toJson() => {
        'guardianName': guardianName,
        'guardianSignature': guardianSignature.toJson(),
        'guardianDate': guardianDate?.toIso8601String(),
        'specialistName': specialistName,
        'specialistJobTitle': specialistJobTitle,
        'specialistSignature': specialistSignature.toJson(),
        'specialistDate': specialistDate?.toIso8601String(),
        'teamMembers': teamMembers.map((m) => m.toJson()).toList(),
      };

  factory Section15Data.fromJson(Map<String, dynamic> json) => Section15Data(
        guardianName: json['guardianName'] as String? ?? '',
        guardianSignature: SignatureData.fromJson(json['guardianSignature']),
        guardianDate: json['guardianDate'] != null
            ? DateTime.tryParse(json['guardianDate'] as String)
            : null,
        specialistName: json['specialistName'] as String? ?? '',
        specialistJobTitle: json['specialistJobTitle'] as String? ?? '',
        specialistSignature:
            SignatureData.fromJson(json['specialistSignature']),
        specialistDate: json['specialistDate'] != null
            ? DateTime.tryParse(json['specialistDate'] as String)
            : null,
        teamMembers: (json['teamMembers'] as List<dynamic>? ?? [])
            .map((m) => TeamMemberData.fromJson(m as Map<String, dynamic>))
            .toList(),
      );
}

// =============================================================================
// Section 14 — Daily Routine
// =============================================================================

class Section14Data {
  final String weekdayRoutine;
  final String weekendRoutine;

  const Section14Data({
    this.weekdayRoutine = '',
    this.weekendRoutine = '',
  });

  Section14Data copyWith({
    String? weekdayRoutine,
    String? weekendRoutine,
  }) =>
      Section14Data(
        weekdayRoutine: weekdayRoutine ?? this.weekdayRoutine,
        weekendRoutine: weekendRoutine ?? this.weekendRoutine,
      );

  Map<String, dynamic> toJson() => {
        'weekdayRoutine': weekdayRoutine,
        'weekendRoutine': weekendRoutine,
      };

  factory Section14Data.fromJson(Map<String, dynamic> json) => Section14Data(
        weekdayRoutine: json['weekdayRoutine'] as String? ?? '',
        weekendRoutine: json['weekendRoutine'] as String? ?? '',
      );
}

// =============================================================================
// Top-level form container
// =============================================================================

/// Top-level container persisted in SharedPreferences.
class CaseStudyFormData {
  final int currentStep;
  final Section1Data? section1;
  final Section2Data? section2;
  final Section3Data? section3;
  final Section4Data? section4;
  final Section5Data? section5;
  final Section6Data? section6;
  final Section7Data? section7;
  final Section8Data? section8;
  final Section9Data? section9;
  final Section10Data? section10;
  final Section11Data? section11;
  final SectionDocumentsConsentData? sectionDocs;
  final Section13Data? section13;
  final Section14Data? section14;
  final Section15Data? section15;
  final bool isCompleted;

  const CaseStudyFormData({
    this.currentStep = 0,
    this.section1,
    this.section2,
    this.section3,
    this.section4,
    this.section5,
    this.section6,
    this.section7,
    this.section8,
    this.section9,
    this.section10,
    this.section11,
    this.sectionDocs,
    this.section13,
    this.section14,
    this.section15,
    this.isCompleted = false,
  });

  CaseStudyFormData copyWith({
    int? currentStep,
    Section1Data? section1,
    Section2Data? section2,
    Section3Data? section3,
    Section4Data? section4,
    Section5Data? section5,
    Section6Data? section6,
    Section7Data? section7,
    Section8Data? section8,
    Section9Data? section9,
    Section10Data? section10,
    Section11Data? section11,
    SectionDocumentsConsentData? sectionDocs,
    Section13Data? section13,
    Section14Data? section14,
    Section15Data? section15,
    bool? isCompleted,
  }) =>
      CaseStudyFormData(
        currentStep: currentStep ?? this.currentStep,
        section1: section1 ?? this.section1,
        section2: section2 ?? this.section2,
        section3: section3 ?? this.section3,
        section4: section4 ?? this.section4,
        section5: section5 ?? this.section5,
        section6: section6 ?? this.section6,
        section7: section7 ?? this.section7,
        section8: section8 ?? this.section8,
        section9: section9 ?? this.section9,
        section10: section10 ?? this.section10,
        section11: section11 ?? this.section11,
        sectionDocs: sectionDocs ?? this.sectionDocs,
        section13: section13 ?? this.section13,
        section14: section14 ?? this.section14,
        section15: section15 ?? this.section15,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  Map<String, dynamic> toJson() => {
        'currentStep': currentStep,
        'section1': section1?.toJson(),
        'section2': section2?.toJson(),
        'section3': section3?.toJson(),
        'section4': section4?.toJson(),
        'section5': section5?.toJson(),
        'section6': section6?.toJson(),
        'section7': section7?.toJson(),
        'section8': section8?.toJson(),
        'section9': section9?.toJson(),
        'section10': section10?.toJson(),
        'section11': section11?.toJson(),
        'sectionDocs': sectionDocs?.toJson(),
        'section13': section13?.toJson(),
        'section14': section14?.toJson(),
        'section15': section15?.toJson(),
        'isCompleted': isCompleted,
      };

  factory CaseStudyFormData.fromJson(Map<String, dynamic> json) =>
      CaseStudyFormData(
        currentStep: json['currentStep'] as int? ?? 0,
        section1: json['section1'] != null
            ? Section1Data.fromJson(json['section1'] as Map<String, dynamic>)
            : null,
        section2: json['section2'] != null
            ? Section2Data.fromJson(json['section2'] as Map<String, dynamic>)
            : null,
        section3: json['section3'] != null
            ? Section3Data.fromJson(json['section3'] as Map<String, dynamic>)
            : null,
        section4: json['section4'] != null
            ? Section4Data.fromJson(json['section4'] as Map<String, dynamic>)
            : null,
        section5: json['section5'] != null
            ? Section5Data.fromJson(json['section5'] as Map<String, dynamic>)
            : null,
        section6: json['section6'] != null
            ? Section6Data.fromJson(json['section6'] as Map<String, dynamic>)
            : null,
        section7: json['section7'] != null
            ? Section7Data.fromJson(json['section7'] as Map<String, dynamic>)
            : null,
        section8: json['section8'] != null
            ? Section8Data.fromJson(json['section8'] as Map<String, dynamic>)
            : null,
        section9: json['section9'] != null
            ? Section9Data.fromJson(json['section9'] as Map<String, dynamic>)
            : null,
        section10: json['section10'] != null
            ? Section10Data.fromJson(
                json['section10'] as Map<String, dynamic>)
            : null,
        section11: json['section11'] != null
            ? Section11Data.fromJson(
                json['section11'] as Map<String, dynamic>)
            : null,
        sectionDocs: json['sectionDocs'] != null
            ? SectionDocumentsConsentData.fromJson(
                json['sectionDocs'] as Map<String, dynamic>)
            : null,
        section13: json['section13'] != null
            ? Section13Data.fromJson(
                json['section13'] as Map<String, dynamic>)
            : null,
        section14: json['section14'] != null
            ? Section14Data.fromJson(
                json['section14'] as Map<String, dynamic>)
            : null,
        section15: json['section15'] != null
            ? Section15Data.fromJson(
                json['section15'] as Map<String, dynamic>)
            : null,
        isCompleted: json['isCompleted'] as bool? ?? false,
      );
}
