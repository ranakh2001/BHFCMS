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
  final String childName;
  final String placeOfBirth;
  final DateTime? dateOfBirth;
  final String grade;
  final String childAge;
  final String gender;
  final String nationality;
  final String familyRank;
  final DateTime? centerJoinDate;

  const Section1Data({
    this.childName = '',
    this.placeOfBirth = '',
    this.dateOfBirth,
    this.grade = '',
    this.childAge = '',
    this.gender = '',
    this.nationality = '',
    this.familyRank = '',
    this.centerJoinDate,
  });

  Section1Data copyWith({
    String? childName,
    String? placeOfBirth,
    DateTime? dateOfBirth,
    bool clearDateOfBirth = false,
    String? grade,
    String? childAge,
    String? gender,
    String? nationality,
    String? familyRank,
    DateTime? centerJoinDate,
    bool clearCenterJoinDate = false,
  }) =>
      Section1Data(
        childName: childName ?? this.childName,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        dateOfBirth: clearDateOfBirth ? null : (dateOfBirth ?? this.dateOfBirth),
        grade: grade ?? this.grade,
        childAge: childAge ?? this.childAge,
        gender: gender ?? this.gender,
        nationality: nationality ?? this.nationality,
        familyRank: familyRank ?? this.familyRank,
        centerJoinDate:
            clearCenterJoinDate ? null : (centerJoinDate ?? this.centerJoinDate),
      );

  Map<String, dynamic> toJson() => {
        'childName': childName,
        'placeOfBirth': placeOfBirth,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'grade': grade,
        'childAge': childAge,
        'gender': gender,
        'nationality': nationality,
        'familyRank': familyRank,
        'centerJoinDate': centerJoinDate?.toIso8601String(),
      };

  factory Section1Data.fromJson(Map<String, dynamic> json) => Section1Data(
        childName: json['childName'] as String? ?? '',
        placeOfBirth: json['placeOfBirth'] as String? ?? '',
        dateOfBirth: json['dateOfBirth'] != null
            ? DateTime.tryParse(json['dateOfBirth'] as String)
            : null,
        grade: json['grade'] as String? ?? '',
        childAge: json['childAge'] as String? ?? '',
        gender: json['gender'] as String? ?? '',
        nationality: json['nationality'] as String? ?? '',
        familyRank: json['familyRank'] as String? ?? '',
        centerJoinDate: json['centerJoinDate'] != null
            ? DateTime.tryParse(json['centerJoinDate'] as String)
            : null,
      );
}

class Section2Data {
  final String fatherName;
  final String fatherEducation;
  final String motherName;
  final String motherEducation;
  final bool hasParentKinship;
  final String kinshipType;

  const Section2Data({
    this.fatherName = '',
    this.fatherEducation = '',
    this.motherName = '',
    this.motherEducation = '',
    this.hasParentKinship = false,
    this.kinshipType = '',
  });

  Section2Data copyWith({
    String? fatherName,
    String? fatherEducation,
    String? motherName,
    String? motherEducation,
    bool? hasParentKinship,
    String? kinshipType,
  }) =>
      Section2Data(
        fatherName: fatherName ?? this.fatherName,
        fatherEducation: fatherEducation ?? this.fatherEducation,
        motherName: motherName ?? this.motherName,
        motherEducation: motherEducation ?? this.motherEducation,
        hasParentKinship: hasParentKinship ?? this.hasParentKinship,
        kinshipType: kinshipType ?? this.kinshipType,
      );

  Map<String, dynamic> toJson() => {
        'fatherName': fatherName,
        'fatherEducation': fatherEducation,
        'motherName': motherName,
        'motherEducation': motherEducation,
        'hasParentKinship': hasParentKinship,
        'kinshipType': kinshipType,
      };

  factory Section2Data.fromJson(Map<String, dynamic> json) => Section2Data(
        fatherName: json['fatherName'] as String? ?? '',
        fatherEducation: json['fatherEducation'] as String? ?? '',
        motherName: json['motherName'] as String? ?? '',
        motherEducation: json['motherEducation'] as String? ?? '',
        hasParentKinship: json['hasParentKinship'] as bool? ?? false,
        kinshipType: json['kinshipType'] as String? ?? '',
      );
}

class Section3Data {
  final String homeLanguage;
  final String schoolLanguage;
  final String maritalStatus;
  final String childLivingWith;
  final String childLivingWithOther;
  final String familyRelationship;
  final String familyProvider;
  final String familyIncome;
  final String familyMembersCount;
  final bool hasFamilyHealthConditions;
  final List<FamilyHealthCondition> healthConditions;

  const Section3Data({
    this.homeLanguage = '',
    this.schoolLanguage = '',
    this.maritalStatus = '',
    this.childLivingWith = '',
    this.childLivingWithOther = '',
    this.familyRelationship = '',
    this.familyProvider = '',
    this.familyIncome = '',
    this.familyMembersCount = '',
    this.hasFamilyHealthConditions = false,
    this.healthConditions = const [],
  });

  Section3Data copyWith({
    String? homeLanguage,
    String? schoolLanguage,
    String? maritalStatus,
    String? childLivingWith,
    String? childLivingWithOther,
    String? familyRelationship,
    String? familyProvider,
    String? familyIncome,
    String? familyMembersCount,
    bool? hasFamilyHealthConditions,
    List<FamilyHealthCondition>? healthConditions,
  }) =>
      Section3Data(
        homeLanguage: homeLanguage ?? this.homeLanguage,
        schoolLanguage: schoolLanguage ?? this.schoolLanguage,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        childLivingWith: childLivingWith ?? this.childLivingWith,
        childLivingWithOther: childLivingWithOther ?? this.childLivingWithOther,
        familyRelationship: familyRelationship ?? this.familyRelationship,
        familyProvider: familyProvider ?? this.familyProvider,
        familyIncome: familyIncome ?? this.familyIncome,
        familyMembersCount: familyMembersCount ?? this.familyMembersCount,
        hasFamilyHealthConditions:
            hasFamilyHealthConditions ?? this.hasFamilyHealthConditions,
        healthConditions: healthConditions ?? this.healthConditions,
      );

  Map<String, dynamic> toJson() => {
        'homeLanguage': homeLanguage,
        'schoolLanguage': schoolLanguage,
        'maritalStatus': maritalStatus,
        'childLivingWith': childLivingWith,
        'childLivingWithOther': childLivingWithOther,
        'familyRelationship': familyRelationship,
        'familyProvider': familyProvider,
        'familyIncome': familyIncome,
        'familyMembersCount': familyMembersCount,
        'hasFamilyHealthConditions': hasFamilyHealthConditions,
        'healthConditions': healthConditions.map((e) => e.toJson()).toList(),
      };

  factory Section3Data.fromJson(Map<String, dynamic> json) => Section3Data(
        homeLanguage: json['homeLanguage'] as String? ?? '',
        schoolLanguage: json['schoolLanguage'] as String? ?? '',
        maritalStatus: json['maritalStatus'] as String? ?? '',
        childLivingWith: json['childLivingWith'] as String? ?? '',
        childLivingWithOther: json['childLivingWithOther'] as String? ?? '',
        familyRelationship: json['familyRelationship'] as String? ?? '',
        familyProvider: json['familyProvider'] as String? ?? '',
        familyIncome: json['familyIncome'] as String? ?? '',
        familyMembersCount: json['familyMembersCount'] as String? ?? '',
        hasFamilyHealthConditions:
            json['hasFamilyHealthConditions'] as bool? ?? false,
        healthConditions: (json['healthConditions'] as List<dynamic>?)
                ?.map((e) =>
                    FamilyHealthCondition.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      );
}

// =============================================================================
// Section 4 — Medical Information & Birth History (Pregnancy Period)
// =============================================================================

/// Six specific diseases checked during pregnancy.
class PregnancyDiseaseFlags {
  final bool? diabetes;
  final bool? bloodPressure;
  final bool? albuminuria;
  final bool? preeclampsia;
  final bool? rubella;
  final bool? bleeding;

  const PregnancyDiseaseFlags({
    this.diabetes,
    this.bloodPressure,
    this.albuminuria,
    this.preeclampsia,
    this.rubella,
    this.bleeding,
  });

  PregnancyDiseaseFlags copyWith({
    bool? diabetes,
    bool? bloodPressure,
    bool? albuminuria,
    bool? preeclampsia,
    bool? rubella,
    bool? bleeding,
  }) =>
      PregnancyDiseaseFlags(
        diabetes: diabetes ?? this.diabetes,
        bloodPressure: bloodPressure ?? this.bloodPressure,
        albuminuria: albuminuria ?? this.albuminuria,
        preeclampsia: preeclampsia ?? this.preeclampsia,
        rubella: rubella ?? this.rubella,
        bleeding: bleeding ?? this.bleeding,
      );

  Map<String, dynamic> toJson() => {
        'diabetes': diabetes,
        'bloodPressure': bloodPressure,
        'albuminuria': albuminuria,
        'preeclampsia': preeclampsia,
        'rubella': rubella,
        'bleeding': bleeding,
      };

  factory PregnancyDiseaseFlags.fromJson(Map<String, dynamic> json) =>
      PregnancyDiseaseFlags(
        diabetes: json['diabetes'] as bool?,
        bloodPressure: json['bloodPressure'] as bool?,
        albuminuria: json['albuminuria'] as bool?,
        preeclampsia: json['preeclampsia'] as bool?,
        rubella: json['rubella'] as bool?,
        bleeding: json['bleeding'] as bool?,
      );
}

class Section4Data {
  final bool? tookMedication;
  final String medicationType;
  final bool? hadDoctorFollowUp;
  final bool? followUpWasRegular;
  final bool? exposedToRadiation;
  final bool? hadInjuriesOrFalls;
  final String injuriesDescription;
  final bool? hadPsychologicalTrauma;
  final bool? pregnancyWasNineMonths;
  final String pregnancyDuration;
  final PregnancyDiseaseFlags pregnancyDiseases;
  final bool? hadInfectiousDiseases;
  final String infectiousDiseaseType;
  final bool? hasChronicDiseases;
  final String chronicDiseaseType;
  final bool? hadLabTests;
  final String labTestsDescription;
  final bool? tookStabilizingMedication;
  final String totalPregnanciesCount;
  final bool? hadMiscarriage;
  final bool? exposedToSmoking;

  const Section4Data({
    this.tookMedication,
    this.medicationType = '',
    this.hadDoctorFollowUp,
    this.followUpWasRegular,
    this.exposedToRadiation,
    this.hadInjuriesOrFalls,
    this.injuriesDescription = '',
    this.hadPsychologicalTrauma,
    this.pregnancyWasNineMonths,
    this.pregnancyDuration = '',
    this.pregnancyDiseases = const PregnancyDiseaseFlags(),
    this.hadInfectiousDiseases,
    this.infectiousDiseaseType = '',
    this.hasChronicDiseases,
    this.chronicDiseaseType = '',
    this.hadLabTests,
    this.labTestsDescription = '',
    this.tookStabilizingMedication,
    this.totalPregnanciesCount = '',
    this.hadMiscarriage,
    this.exposedToSmoking,
  });

  Section4Data copyWith({
    bool? tookMedication,
    String? medicationType,
    bool? hadDoctorFollowUp,
    bool? followUpWasRegular,
    bool? exposedToRadiation,
    bool? hadInjuriesOrFalls,
    String? injuriesDescription,
    bool? hadPsychologicalTrauma,
    bool? pregnancyWasNineMonths,
    String? pregnancyDuration,
    PregnancyDiseaseFlags? pregnancyDiseases,
    bool? hadInfectiousDiseases,
    String? infectiousDiseaseType,
    bool? hasChronicDiseases,
    String? chronicDiseaseType,
    bool? hadLabTests,
    String? labTestsDescription,
    bool? tookStabilizingMedication,
    String? totalPregnanciesCount,
    bool? hadMiscarriage,
    bool? exposedToSmoking,
  }) =>
      Section4Data(
        tookMedication: tookMedication ?? this.tookMedication,
        medicationType: medicationType ?? this.medicationType,
        hadDoctorFollowUp: hadDoctorFollowUp ?? this.hadDoctorFollowUp,
        followUpWasRegular: followUpWasRegular ?? this.followUpWasRegular,
        exposedToRadiation: exposedToRadiation ?? this.exposedToRadiation,
        hadInjuriesOrFalls: hadInjuriesOrFalls ?? this.hadInjuriesOrFalls,
        injuriesDescription: injuriesDescription ?? this.injuriesDescription,
        hadPsychologicalTrauma:
            hadPsychologicalTrauma ?? this.hadPsychologicalTrauma,
        pregnancyWasNineMonths:
            pregnancyWasNineMonths ?? this.pregnancyWasNineMonths,
        pregnancyDuration: pregnancyDuration ?? this.pregnancyDuration,
        pregnancyDiseases: pregnancyDiseases ?? this.pregnancyDiseases,
        hadInfectiousDiseases:
            hadInfectiousDiseases ?? this.hadInfectiousDiseases,
        infectiousDiseaseType:
            infectiousDiseaseType ?? this.infectiousDiseaseType,
        hasChronicDiseases: hasChronicDiseases ?? this.hasChronicDiseases,
        chronicDiseaseType: chronicDiseaseType ?? this.chronicDiseaseType,
        hadLabTests: hadLabTests ?? this.hadLabTests,
        labTestsDescription: labTestsDescription ?? this.labTestsDescription,
        tookStabilizingMedication:
            tookStabilizingMedication ?? this.tookStabilizingMedication,
        totalPregnanciesCount:
            totalPregnanciesCount ?? this.totalPregnanciesCount,
        hadMiscarriage: hadMiscarriage ?? this.hadMiscarriage,
        exposedToSmoking: exposedToSmoking ?? this.exposedToSmoking,
      );

  Map<String, dynamic> toJson() => {
        'tookMedication': tookMedication,
        'medicationType': medicationType,
        'hadDoctorFollowUp': hadDoctorFollowUp,
        'followUpWasRegular': followUpWasRegular,
        'exposedToRadiation': exposedToRadiation,
        'hadInjuriesOrFalls': hadInjuriesOrFalls,
        'injuriesDescription': injuriesDescription,
        'hadPsychologicalTrauma': hadPsychologicalTrauma,
        'pregnancyWasNineMonths': pregnancyWasNineMonths,
        'pregnancyDuration': pregnancyDuration,
        'pregnancyDiseases': pregnancyDiseases.toJson(),
        'hadInfectiousDiseases': hadInfectiousDiseases,
        'infectiousDiseaseType': infectiousDiseaseType,
        'hasChronicDiseases': hasChronicDiseases,
        'chronicDiseaseType': chronicDiseaseType,
        'hadLabTests': hadLabTests,
        'labTestsDescription': labTestsDescription,
        'tookStabilizingMedication': tookStabilizingMedication,
        'totalPregnanciesCount': totalPregnanciesCount,
        'hadMiscarriage': hadMiscarriage,
        'exposedToSmoking': exposedToSmoking,
      };

  factory Section4Data.fromJson(Map<String, dynamic> json) => Section4Data(
        tookMedication: json['tookMedication'] as bool?,
        medicationType: json['medicationType'] as String? ?? '',
        hadDoctorFollowUp: json['hadDoctorFollowUp'] as bool?,
        followUpWasRegular: json['followUpWasRegular'] as bool?,
        exposedToRadiation: json['exposedToRadiation'] as bool?,
        hadInjuriesOrFalls: json['hadInjuriesOrFalls'] as bool?,
        injuriesDescription: json['injuriesDescription'] as String? ?? '',
        hadPsychologicalTrauma: json['hadPsychologicalTrauma'] as bool?,
        pregnancyWasNineMonths: json['pregnancyWasNineMonths'] as bool?,
        pregnancyDuration: json['pregnancyDuration'] as String? ?? '',
        pregnancyDiseases: json['pregnancyDiseases'] != null
            ? PregnancyDiseaseFlags.fromJson(
                json['pregnancyDiseases'] as Map<String, dynamic>)
            : const PregnancyDiseaseFlags(),
        hadInfectiousDiseases: json['hadInfectiousDiseases'] as bool?,
        infectiousDiseaseType: json['infectiousDiseaseType'] as String? ?? '',
        hasChronicDiseases: json['hasChronicDiseases'] as bool?,
        chronicDiseaseType: json['chronicDiseaseType'] as String? ?? '',
        hadLabTests: json['hadLabTests'] as bool?,
        labTestsDescription: json['labTestsDescription'] as String? ?? '',
        tookStabilizingMedication:
            json['tookStabilizingMedication'] as bool?,
        totalPregnanciesCount:
            json['totalPregnanciesCount'] as String? ?? '',
        hadMiscarriage: json['hadMiscarriage'] as bool?,
        exposedToSmoking: json['exposedToSmoking'] as bool?,
      );
}

// =============================================================================
// Section 5 — Medical Information & Birth History (Birth Period)
// =============================================================================

class Section5Data {
  final String birthType; // 'natural' | 'cesarean'
  final String birthPlace; // 'home' | 'hospital'
  final bool? usedBirthTools;
  final bool? tookDeliveryMedication;
  final bool? oxygenDeficiency;
  final bool? umbilicalCordWrapped;
  final bool? breechPosition;
  final String breechDuration;
  final bool? hadJaundice;
  final bool? hadCongenitalDeformities;
  final String congenitalDeformitiesType;
  final String birthWeight;
  final bool? hadRhTest;

  const Section5Data({
    this.birthType = '',
    this.birthPlace = '',
    this.usedBirthTools,
    this.tookDeliveryMedication,
    this.oxygenDeficiency,
    this.umbilicalCordWrapped,
    this.breechPosition,
    this.breechDuration = '',
    this.hadJaundice,
    this.hadCongenitalDeformities,
    this.congenitalDeformitiesType = '',
    this.birthWeight = '',
    this.hadRhTest,
  });

  Section5Data copyWith({
    String? birthType,
    String? birthPlace,
    bool? usedBirthTools,
    bool? tookDeliveryMedication,
    bool? oxygenDeficiency,
    bool? umbilicalCordWrapped,
    bool? breechPosition,
    String? breechDuration,
    bool? hadJaundice,
    bool? hadCongenitalDeformities,
    String? congenitalDeformitiesType,
    String? birthWeight,
    bool? hadRhTest,
  }) =>
      Section5Data(
        birthType: birthType ?? this.birthType,
        birthPlace: birthPlace ?? this.birthPlace,
        usedBirthTools: usedBirthTools ?? this.usedBirthTools,
        tookDeliveryMedication:
            tookDeliveryMedication ?? this.tookDeliveryMedication,
        oxygenDeficiency: oxygenDeficiency ?? this.oxygenDeficiency,
        umbilicalCordWrapped: umbilicalCordWrapped ?? this.umbilicalCordWrapped,
        breechPosition: breechPosition ?? this.breechPosition,
        breechDuration: breechDuration ?? this.breechDuration,
        hadJaundice: hadJaundice ?? this.hadJaundice,
        hadCongenitalDeformities:
            hadCongenitalDeformities ?? this.hadCongenitalDeformities,
        congenitalDeformitiesType:
            congenitalDeformitiesType ?? this.congenitalDeformitiesType,
        birthWeight: birthWeight ?? this.birthWeight,
        hadRhTest: hadRhTest ?? this.hadRhTest,
      );

  Map<String, dynamic> toJson() => {
        'birthType': birthType,
        'birthPlace': birthPlace,
        'usedBirthTools': usedBirthTools,
        'tookDeliveryMedication': tookDeliveryMedication,
        'oxygenDeficiency': oxygenDeficiency,
        'umbilicalCordWrapped': umbilicalCordWrapped,
        'breechPosition': breechPosition,
        'breechDuration': breechDuration,
        'hadJaundice': hadJaundice,
        'hadCongenitalDeformities': hadCongenitalDeformities,
        'congenitalDeformitiesType': congenitalDeformitiesType,
        'birthWeight': birthWeight,
        'hadRhTest': hadRhTest,
      };

  factory Section5Data.fromJson(Map<String, dynamic> json) => Section5Data(
        birthType: json['birthType'] as String? ?? '',
        birthPlace: json['birthPlace'] as String? ?? '',
        usedBirthTools: json['usedBirthTools'] as bool?,
        tookDeliveryMedication: json['tookDeliveryMedication'] as bool?,
        oxygenDeficiency: json['oxygenDeficiency'] as bool?,
        umbilicalCordWrapped: json['umbilicalCordWrapped'] as bool?,
        breechPosition: json['breechPosition'] as bool?,
        breechDuration: json['breechDuration'] as String? ?? '',
        hadJaundice: json['hadJaundice'] as bool?,
        hadCongenitalDeformities: json['hadCongenitalDeformities'] as bool?,
        congenitalDeformitiesType:
            json['congenitalDeformitiesType'] as String? ?? '',
        birthWeight: json['birthWeight'] as String? ?? '',
        hadRhTest: json['hadRhTest'] as bool?,
      );
}

// =============================================================================
// Section 6 — Medical Information & Birth History (Post-Birth Period)
// =============================================================================

class PostBirthDiseaseFlags {
  final bool? meningitis;
  final bool? measles;
  final bool? chickenpox;
  final bool? mumps;

  const PostBirthDiseaseFlags({
    this.meningitis,
    this.measles,
    this.chickenpox,
    this.mumps,
  });

  PostBirthDiseaseFlags copyWith({
    bool? meningitis,
    bool? measles,
    bool? chickenpox,
    bool? mumps,
  }) =>
      PostBirthDiseaseFlags(
        meningitis: meningitis ?? this.meningitis,
        measles: measles ?? this.measles,
        chickenpox: chickenpox ?? this.chickenpox,
        mumps: mumps ?? this.mumps,
      );

  Map<String, dynamic> toJson() => {
        'meningitis': meningitis,
        'measles': measles,
        'chickenpox': chickenpox,
        'mumps': mumps,
      };

  factory PostBirthDiseaseFlags.fromJson(Map<String, dynamic> json) =>
      PostBirthDiseaseFlags(
        meningitis: json['meningitis'] as bool?,
        measles: json['measles'] as bool?,
        chickenpox: json['chickenpox'] as bool?,
        mumps: json['mumps'] as bool?,
      );
}

class Section6Data {
  final String breastfeedingType; // 'natural' | 'artificial' | 'both'
  final PostBirthDiseaseFlags diseases;
  final bool? tookLongTermMedication;
  final String longTermMedicationType;
  final bool? hadFallsOrAccidents;
  final bool? hadHipDislocationExam;
  final bool? hasChronicDiseases;
  final String chronicDiseaseType;
  final bool? ateWell;
  final bool? hospitalizedBefore;
  final String surgicalOperations;

  const Section6Data({
    this.breastfeedingType = '',
    this.diseases = const PostBirthDiseaseFlags(),
    this.tookLongTermMedication,
    this.longTermMedicationType = '',
    this.hadFallsOrAccidents,
    this.hadHipDislocationExam,
    this.hasChronicDiseases,
    this.chronicDiseaseType = '',
    this.ateWell,
    this.hospitalizedBefore,
    this.surgicalOperations = '',
  });

  Section6Data copyWith({
    String? breastfeedingType,
    PostBirthDiseaseFlags? diseases,
    bool? tookLongTermMedication,
    String? longTermMedicationType,
    bool? hadFallsOrAccidents,
    bool? hadHipDislocationExam,
    bool? hasChronicDiseases,
    String? chronicDiseaseType,
    bool? ateWell,
    bool? hospitalizedBefore,
    String? surgicalOperations,
  }) =>
      Section6Data(
        breastfeedingType: breastfeedingType ?? this.breastfeedingType,
        diseases: diseases ?? this.diseases,
        tookLongTermMedication:
            tookLongTermMedication ?? this.tookLongTermMedication,
        longTermMedicationType:
            longTermMedicationType ?? this.longTermMedicationType,
        hadFallsOrAccidents: hadFallsOrAccidents ?? this.hadFallsOrAccidents,
        hadHipDislocationExam:
            hadHipDislocationExam ?? this.hadHipDislocationExam,
        hasChronicDiseases: hasChronicDiseases ?? this.hasChronicDiseases,
        chronicDiseaseType: chronicDiseaseType ?? this.chronicDiseaseType,
        ateWell: ateWell ?? this.ateWell,
        hospitalizedBefore: hospitalizedBefore ?? this.hospitalizedBefore,
        surgicalOperations: surgicalOperations ?? this.surgicalOperations,
      );

  Map<String, dynamic> toJson() => {
        'breastfeedingType': breastfeedingType,
        'diseases': diseases.toJson(),
        'tookLongTermMedication': tookLongTermMedication,
        'longTermMedicationType': longTermMedicationType,
        'hadFallsOrAccidents': hadFallsOrAccidents,
        'hadHipDislocationExam': hadHipDislocationExam,
        'hasChronicDiseases': hasChronicDiseases,
        'chronicDiseaseType': chronicDiseaseType,
        'ateWell': ateWell,
        'hospitalizedBefore': hospitalizedBefore,
        'surgicalOperations': surgicalOperations,
      };

  factory Section6Data.fromJson(Map<String, dynamic> json) => Section6Data(
        breastfeedingType: json['breastfeedingType'] as String? ?? '',
        diseases: json['diseases'] != null
            ? PostBirthDiseaseFlags.fromJson(
                json['diseases'] as Map<String, dynamic>)
            : const PostBirthDiseaseFlags(),
        tookLongTermMedication: json['tookLongTermMedication'] as bool?,
        longTermMedicationType:
            json['longTermMedicationType'] as String? ?? '',
        hadFallsOrAccidents: json['hadFallsOrAccidents'] as bool?,
        hadHipDislocationExam: json['hadHipDislocationExam'] as bool?,
        hasChronicDiseases: json['hasChronicDiseases'] as bool?,
        chronicDiseaseType: json['chronicDiseaseType'] as String? ?? '',
        ateWell: json['ateWell'] as bool?,
        hospitalizedBefore: json['hospitalizedBefore'] as bool?,
        surgicalOperations: json['surgicalOperations'] as String? ?? '',
      );
}

// =============================================================================
// Section 7 — Behavioral Issues
// =============================================================================

class BehavioralFlags {
  final bool? thumbSucking;
  final bool? nailBiting;
  final bool? bedwetting;
  final bool? foodAversion;
  final bool? sleepDisorder;
  final bool? continuousCrying;
  final bool? daydreaming;
  final bool? angerAttacks;
  final bool? aggression;
  final bool? destroyingObjects;
  final bool? epilepticSeizures;
  final bool? speechDifficulties;

  const BehavioralFlags({
    this.thumbSucking,
    this.nailBiting,
    this.bedwetting,
    this.foodAversion,
    this.sleepDisorder,
    this.continuousCrying,
    this.daydreaming,
    this.angerAttacks,
    this.aggression,
    this.destroyingObjects,
    this.epilepticSeizures,
    this.speechDifficulties,
  });

  BehavioralFlags copyWith({
    bool? thumbSucking,
    bool? nailBiting,
    bool? bedwetting,
    bool? foodAversion,
    bool? sleepDisorder,
    bool? continuousCrying,
    bool? daydreaming,
    bool? angerAttacks,
    bool? aggression,
    bool? destroyingObjects,
    bool? epilepticSeizures,
    bool? speechDifficulties,
  }) =>
      BehavioralFlags(
        thumbSucking: thumbSucking ?? this.thumbSucking,
        nailBiting: nailBiting ?? this.nailBiting,
        bedwetting: bedwetting ?? this.bedwetting,
        foodAversion: foodAversion ?? this.foodAversion,
        sleepDisorder: sleepDisorder ?? this.sleepDisorder,
        continuousCrying: continuousCrying ?? this.continuousCrying,
        daydreaming: daydreaming ?? this.daydreaming,
        angerAttacks: angerAttacks ?? this.angerAttacks,
        aggression: aggression ?? this.aggression,
        destroyingObjects: destroyingObjects ?? this.destroyingObjects,
        epilepticSeizures: epilepticSeizures ?? this.epilepticSeizures,
        speechDifficulties: speechDifficulties ?? this.speechDifficulties,
      );

  Map<String, dynamic> toJson() => {
        'thumbSucking': thumbSucking,
        'nailBiting': nailBiting,
        'bedwetting': bedwetting,
        'foodAversion': foodAversion,
        'sleepDisorder': sleepDisorder,
        'continuousCrying': continuousCrying,
        'daydreaming': daydreaming,
        'angerAttacks': angerAttacks,
        'aggression': aggression,
        'destroyingObjects': destroyingObjects,
        'epilepticSeizures': epilepticSeizures,
        'speechDifficulties': speechDifficulties,
      };

  factory BehavioralFlags.fromJson(Map<String, dynamic> json) =>
      BehavioralFlags(
        thumbSucking: json['thumbSucking'] as bool?,
        nailBiting: json['nailBiting'] as bool?,
        bedwetting: json['bedwetting'] as bool?,
        foodAversion: json['foodAversion'] as bool?,
        sleepDisorder: json['sleepDisorder'] as bool?,
        continuousCrying: json['continuousCrying'] as bool?,
        daydreaming: json['daydreaming'] as bool?,
        angerAttacks: json['angerAttacks'] as bool?,
        aggression: json['aggression'] as bool?,
        destroyingObjects: json['destroyingObjects'] as bool?,
        epilepticSeizures: json['epilepticSeizures'] as bool?,
        speechDifficulties: json['speechDifficulties'] as bool?,
      );
}

class VaccineFlags {
  final bool? tripleQuadrupleQuintuple;
  final bool? polio;
  final bool? tuberculosis;
  final bool? measles;
  final bool? germanMeaslesMumps;
  final bool? hepatitisB;

  const VaccineFlags({
    this.tripleQuadrupleQuintuple,
    this.polio,
    this.tuberculosis,
    this.measles,
    this.germanMeaslesMumps,
    this.hepatitisB,
  });

  VaccineFlags copyWith({
    bool? tripleQuadrupleQuintuple,
    bool? polio,
    bool? tuberculosis,
    bool? measles,
    bool? germanMeaslesMumps,
    bool? hepatitisB,
  }) =>
      VaccineFlags(
        tripleQuadrupleQuintuple:
            tripleQuadrupleQuintuple ?? this.tripleQuadrupleQuintuple,
        polio: polio ?? this.polio,
        tuberculosis: tuberculosis ?? this.tuberculosis,
        measles: measles ?? this.measles,
        germanMeaslesMumps: germanMeaslesMumps ?? this.germanMeaslesMumps,
        hepatitisB: hepatitisB ?? this.hepatitisB,
      );

  Map<String, dynamic> toJson() => {
        'tripleQuadrupleQuintuple': tripleQuadrupleQuintuple,
        'polio': polio,
        'tuberculosis': tuberculosis,
        'measles': measles,
        'germanMeaslesMumps': germanMeaslesMumps,
        'hepatitisB': hepatitisB,
      };

  factory VaccineFlags.fromJson(Map<String, dynamic> json) => VaccineFlags(
        tripleQuadrupleQuintuple:
            json['tripleQuadrupleQuintuple'] as bool?,
        polio: json['polio'] as bool?,
        tuberculosis: json['tuberculosis'] as bool?,
        measles: json['measles'] as bool?,
        germanMeaslesMumps: json['germanMeaslesMumps'] as bool?,
        hepatitisB: json['hepatitisB'] as bool?,
      );
}

class Section7Data {
  final BehavioralFlags behaviors;
  final VaccineFlags vaccines;

  const Section7Data({
    this.behaviors = const BehavioralFlags(),
    this.vaccines = const VaccineFlags(),
  });

  Section7Data copyWith({
    BehavioralFlags? behaviors,
    VaccineFlags? vaccines,
  }) =>
      Section7Data(
        behaviors: behaviors ?? this.behaviors,
        vaccines: vaccines ?? this.vaccines,
      );

  Map<String, dynamic> toJson() => {
        'behaviors': behaviors.toJson(),
        'vaccines': vaccines.toJson(),
      };

  factory Section7Data.fromJson(Map<String, dynamic> json) => Section7Data(
        behaviors: json['behaviors'] != null
            ? BehavioralFlags.fromJson(
                json['behaviors'] as Map<String, dynamic>)
            : const BehavioralFlags(),
        vaccines: json['vaccines'] != null
            ? VaccineFlags.fromJson(json['vaccines'] as Map<String, dynamic>)
            : const VaccineFlags(),
      );
}

// =============================================================================
// Section 8 — Developmental Growth (Motor & Physical)
// =============================================================================

class Section8Data {
  final bool? satAtRightTime;
  final bool? crawledAtRightTime;
  final bool? walkedAtRightTime;
  final String teethingAge;
  final bool? dropsThings;
  final bool? hasMovementDifficulties;
  final bool? isConstantlyMoving;
  final bool? hasVisualImpairment;
  final String visualImpairmentDegree;
  final bool? hasEyeDiseases;
  final String eyeDiseasesType;
  final bool? hasHearingImpairment;
  final String hearingImpairmentDegree;
  final bool? hasEarDiseases;
  final String earDiseasesType;
  final bool? hasAllergies;
  final String allergyType; // 'food' | 'environmental'
  final String allergyTriggers;

  const Section8Data({
    this.satAtRightTime,
    this.crawledAtRightTime,
    this.walkedAtRightTime,
    this.teethingAge = '',
    this.dropsThings,
    this.hasMovementDifficulties,
    this.isConstantlyMoving,
    this.hasVisualImpairment,
    this.visualImpairmentDegree = '',
    this.hasEyeDiseases,
    this.eyeDiseasesType = '',
    this.hasHearingImpairment,
    this.hearingImpairmentDegree = '',
    this.hasEarDiseases,
    this.earDiseasesType = '',
    this.hasAllergies,
    this.allergyType = '',
    this.allergyTriggers = '',
  });

  Section8Data copyWith({
    bool? satAtRightTime,
    bool? crawledAtRightTime,
    bool? walkedAtRightTime,
    String? teethingAge,
    bool? dropsThings,
    bool? hasMovementDifficulties,
    bool? isConstantlyMoving,
    bool? hasVisualImpairment,
    String? visualImpairmentDegree,
    bool? hasEyeDiseases,
    String? eyeDiseasesType,
    bool? hasHearingImpairment,
    String? hearingImpairmentDegree,
    bool? hasEarDiseases,
    String? earDiseasesType,
    bool? hasAllergies,
    String? allergyType,
    String? allergyTriggers,
  }) =>
      Section8Data(
        satAtRightTime: satAtRightTime ?? this.satAtRightTime,
        crawledAtRightTime: crawledAtRightTime ?? this.crawledAtRightTime,
        walkedAtRightTime: walkedAtRightTime ?? this.walkedAtRightTime,
        teethingAge: teethingAge ?? this.teethingAge,
        dropsThings: dropsThings ?? this.dropsThings,
        hasMovementDifficulties:
            hasMovementDifficulties ?? this.hasMovementDifficulties,
        isConstantlyMoving: isConstantlyMoving ?? this.isConstantlyMoving,
        hasVisualImpairment: hasVisualImpairment ?? this.hasVisualImpairment,
        visualImpairmentDegree:
            visualImpairmentDegree ?? this.visualImpairmentDegree,
        hasEyeDiseases: hasEyeDiseases ?? this.hasEyeDiseases,
        eyeDiseasesType: eyeDiseasesType ?? this.eyeDiseasesType,
        hasHearingImpairment: hasHearingImpairment ?? this.hasHearingImpairment,
        hearingImpairmentDegree:
            hearingImpairmentDegree ?? this.hearingImpairmentDegree,
        hasEarDiseases: hasEarDiseases ?? this.hasEarDiseases,
        earDiseasesType: earDiseasesType ?? this.earDiseasesType,
        hasAllergies: hasAllergies ?? this.hasAllergies,
        allergyType: allergyType ?? this.allergyType,
        allergyTriggers: allergyTriggers ?? this.allergyTriggers,
      );

  Map<String, dynamic> toJson() => {
        'satAtRightTime': satAtRightTime,
        'crawledAtRightTime': crawledAtRightTime,
        'walkedAtRightTime': walkedAtRightTime,
        'teethingAge': teethingAge,
        'dropsThings': dropsThings,
        'hasMovementDifficulties': hasMovementDifficulties,
        'isConstantlyMoving': isConstantlyMoving,
        'hasVisualImpairment': hasVisualImpairment,
        'visualImpairmentDegree': visualImpairmentDegree,
        'hasEyeDiseases': hasEyeDiseases,
        'eyeDiseasesType': eyeDiseasesType,
        'hasHearingImpairment': hasHearingImpairment,
        'hearingImpairmentDegree': hearingImpairmentDegree,
        'hasEarDiseases': hasEarDiseases,
        'earDiseasesType': earDiseasesType,
        'hasAllergies': hasAllergies,
        'allergyType': allergyType,
        'allergyTriggers': allergyTriggers,
      };

  factory Section8Data.fromJson(Map<String, dynamic> json) => Section8Data(
        satAtRightTime: json['satAtRightTime'] as bool?,
        crawledAtRightTime: json['crawledAtRightTime'] as bool?,
        walkedAtRightTime: json['walkedAtRightTime'] as bool?,
        teethingAge: json['teethingAge'] as String? ?? '',
        dropsThings: json['dropsThings'] as bool?,
        hasMovementDifficulties: json['hasMovementDifficulties'] as bool?,
        isConstantlyMoving: json['isConstantlyMoving'] as bool?,
        hasVisualImpairment: json['hasVisualImpairment'] as bool?,
        visualImpairmentDegree:
            json['visualImpairmentDegree'] as String? ?? '',
        hasEyeDiseases: json['hasEyeDiseases'] as bool?,
        eyeDiseasesType: json['eyeDiseasesType'] as String? ?? '',
        hasHearingImpairment: json['hasHearingImpairment'] as bool?,
        hearingImpairmentDegree:
            json['hearingImpairmentDegree'] as String? ?? '',
        hasEarDiseases: json['hasEarDiseases'] as bool?,
        earDiseasesType: json['earDiseasesType'] as String? ?? '',
        hasAllergies: json['hasAllergies'] as bool?,
        allergyType: json['allergyType'] as String? ?? '',
        allergyTriggers: json['allergyTriggers'] as String? ?? '',
      );
}

// =============================================================================
// Section 9 — Developmental Growth (Language Aspects)
// =============================================================================

class Section9Data {
  final bool? speechUnderstoodByMother;
  final bool? hasStuttering;
  final bool? hasLetterSubstitution;
  final String substitutedLetters;
  final bool? speaksUnintelligibly;
  final bool? hasPronunciationDifficulty;
  final String difficultLettersAndWords;
  final bool? languageLikeAgePeers;

  const Section9Data({
    this.speechUnderstoodByMother,
    this.hasStuttering,
    this.hasLetterSubstitution,
    this.substitutedLetters = '',
    this.speaksUnintelligibly,
    this.hasPronunciationDifficulty,
    this.difficultLettersAndWords = '',
    this.languageLikeAgePeers,
  });

  Section9Data copyWith({
    bool? speechUnderstoodByMother,
    bool? hasStuttering,
    bool? hasLetterSubstitution,
    String? substitutedLetters,
    bool? speaksUnintelligibly,
    bool? hasPronunciationDifficulty,
    String? difficultLettersAndWords,
    bool? languageLikeAgePeers,
  }) =>
      Section9Data(
        speechUnderstoodByMother:
            speechUnderstoodByMother ?? this.speechUnderstoodByMother,
        hasStuttering: hasStuttering ?? this.hasStuttering,
        hasLetterSubstitution:
            hasLetterSubstitution ?? this.hasLetterSubstitution,
        substitutedLetters: substitutedLetters ?? this.substitutedLetters,
        speaksUnintelligibly:
            speaksUnintelligibly ?? this.speaksUnintelligibly,
        hasPronunciationDifficulty:
            hasPronunciationDifficulty ?? this.hasPronunciationDifficulty,
        difficultLettersAndWords:
            difficultLettersAndWords ?? this.difficultLettersAndWords,
        languageLikeAgePeers:
            languageLikeAgePeers ?? this.languageLikeAgePeers,
      );

  Map<String, dynamic> toJson() => {
        'speechUnderstoodByMother': speechUnderstoodByMother,
        'hasStuttering': hasStuttering,
        'hasLetterSubstitution': hasLetterSubstitution,
        'substitutedLetters': substitutedLetters,
        'speaksUnintelligibly': speaksUnintelligibly,
        'hasPronunciationDifficulty': hasPronunciationDifficulty,
        'difficultLettersAndWords': difficultLettersAndWords,
        'languageLikeAgePeers': languageLikeAgePeers,
      };

  factory Section9Data.fromJson(Map<String, dynamic> json) => Section9Data(
        speechUnderstoodByMother: json['speechUnderstoodByMother'] as bool?,
        hasStuttering: json['hasStuttering'] as bool?,
        hasLetterSubstitution: json['hasLetterSubstitution'] as bool?,
        substitutedLetters: json['substitutedLetters'] as String? ?? '',
        speaksUnintelligibly: json['speaksUnintelligibly'] as bool?,
        hasPronunciationDifficulty:
            json['hasPronunciationDifficulty'] as bool?,
        difficultLettersAndWords:
            json['difficultLettersAndWords'] as String? ?? '',
        languageLikeAgePeers: json['languageLikeAgePeers'] as bool?,
      );
}

// =============================================================================
// Section 10 — Developmental Growth (Cognitive Aspects)
// =============================================================================

class Section10Data {
  final bool? followsInstructions;
  final bool? completesAssignedTasks;
  final String understandsInstructions; // 'always' | 'sometimes' | 'rarely'
  final bool? hasMemoryDifficulty;
  final bool? hasNamingDifficulty;
  final bool? isImpulsive;
  final String concentrationLevel; // 'good' | 'average' | 'weak'

  const Section10Data({
    this.followsInstructions,
    this.completesAssignedTasks,
    this.understandsInstructions = '',
    this.hasMemoryDifficulty,
    this.hasNamingDifficulty,
    this.isImpulsive,
    this.concentrationLevel = '',
  });

  Section10Data copyWith({
    bool? followsInstructions,
    bool? completesAssignedTasks,
    String? understandsInstructions,
    bool? hasMemoryDifficulty,
    bool? hasNamingDifficulty,
    bool? isImpulsive,
    String? concentrationLevel,
  }) =>
      Section10Data(
        followsInstructions: followsInstructions ?? this.followsInstructions,
        completesAssignedTasks:
            completesAssignedTasks ?? this.completesAssignedTasks,
        understandsInstructions:
            understandsInstructions ?? this.understandsInstructions,
        hasMemoryDifficulty: hasMemoryDifficulty ?? this.hasMemoryDifficulty,
        hasNamingDifficulty: hasNamingDifficulty ?? this.hasNamingDifficulty,
        isImpulsive: isImpulsive ?? this.isImpulsive,
        concentrationLevel: concentrationLevel ?? this.concentrationLevel,
      );

  Map<String, dynamic> toJson() => {
        'followsInstructions': followsInstructions,
        'completesAssignedTasks': completesAssignedTasks,
        'understandsInstructions': understandsInstructions,
        'hasMemoryDifficulty': hasMemoryDifficulty,
        'hasNamingDifficulty': hasNamingDifficulty,
        'isImpulsive': isImpulsive,
        'concentrationLevel': concentrationLevel,
      };

  factory Section10Data.fromJson(Map<String, dynamic> json) => Section10Data(
        followsInstructions: json['followsInstructions'] as bool?,
        completesAssignedTasks: json['completesAssignedTasks'] as bool?,
        understandsInstructions:
            json['understandsInstructions'] as String? ?? '',
        hasMemoryDifficulty: json['hasMemoryDifficulty'] as bool?,
        hasNamingDifficulty: json['hasNamingDifficulty'] as bool?,
        isImpulsive: json['isImpulsive'] as bool?,
        concentrationLevel: json['concentrationLevel'] as String? ?? '',
      );
}

// =============================================================================
// Section 11 — Developmental Growth (Social Aspects)
// =============================================================================

class Section11Data {
  final bool? isQuickToAnger;
  final bool? destroysPlaythings;
  final bool? isStubborn;
  final bool? isAggressive;
  final bool? canPlayCalmly;
  final bool? attacksSiblings;
  final bool? isPopularWithPeers;
  final String behaviorDuringVisits;
  final bool? socialMaturityLikeAgePeers;

  const Section11Data({
    this.isQuickToAnger,
    this.destroysPlaythings,
    this.isStubborn,
    this.isAggressive,
    this.canPlayCalmly,
    this.attacksSiblings,
    this.isPopularWithPeers,
    this.behaviorDuringVisits = '',
    this.socialMaturityLikeAgePeers,
  });

  Section11Data copyWith({
    bool? isQuickToAnger,
    bool? destroysPlaythings,
    bool? isStubborn,
    bool? isAggressive,
    bool? canPlayCalmly,
    bool? attacksSiblings,
    bool? isPopularWithPeers,
    String? behaviorDuringVisits,
    bool? socialMaturityLikeAgePeers,
  }) =>
      Section11Data(
        isQuickToAnger: isQuickToAnger ?? this.isQuickToAnger,
        destroysPlaythings: destroysPlaythings ?? this.destroysPlaythings,
        isStubborn: isStubborn ?? this.isStubborn,
        isAggressive: isAggressive ?? this.isAggressive,
        canPlayCalmly: canPlayCalmly ?? this.canPlayCalmly,
        attacksSiblings: attacksSiblings ?? this.attacksSiblings,
        isPopularWithPeers: isPopularWithPeers ?? this.isPopularWithPeers,
        behaviorDuringVisits:
            behaviorDuringVisits ?? this.behaviorDuringVisits,
        socialMaturityLikeAgePeers:
            socialMaturityLikeAgePeers ?? this.socialMaturityLikeAgePeers,
      );

  Map<String, dynamic> toJson() => {
        'isQuickToAnger': isQuickToAnger,
        'destroysPlaythings': destroysPlaythings,
        'isStubborn': isStubborn,
        'isAggressive': isAggressive,
        'canPlayCalmly': canPlayCalmly,
        'attacksSiblings': attacksSiblings,
        'isPopularWithPeers': isPopularWithPeers,
        'behaviorDuringVisits': behaviorDuringVisits,
        'socialMaturityLikeAgePeers': socialMaturityLikeAgePeers,
      };

  factory Section11Data.fromJson(Map<String, dynamic> json) => Section11Data(
        isQuickToAnger: json['isQuickToAnger'] as bool?,
        destroysPlaythings: json['destroysPlaythings'] as bool?,
        isStubborn: json['isStubborn'] as bool?,
        isAggressive: json['isAggressive'] as bool?,
        canPlayCalmly: json['canPlayCalmly'] as bool?,
        attacksSiblings: json['attacksSiblings'] as bool?,
        isPopularWithPeers: json['isPopularWithPeers'] as bool?,
        behaviorDuringVisits:
            json['behaviorDuringVisits'] as String? ?? '',
        socialMaturityLikeAgePeers:
            json['socialMaturityLikeAgePeers'] as bool?,
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
// Section 13 — Developmental Growth (Self-Care Aspects)
// =============================================================================

class Section13Data {
  final bool? usesToiletProperly;
  final bool? bathesAlone;
  final bool? dressesAlone;
  final bool? usesToothbrush;
  final bool? wearsShoesAlone;
  final bool? washesFaceOnWaking;
  final bool? washesHandsBeforeAfterEating;
  final bool? washesFeetAfterPlay;

  const Section13Data({
    this.usesToiletProperly,
    this.bathesAlone,
    this.dressesAlone,
    this.usesToothbrush,
    this.wearsShoesAlone,
    this.washesFaceOnWaking,
    this.washesHandsBeforeAfterEating,
    this.washesFeetAfterPlay,
  });

  Section13Data copyWith({
    bool? usesToiletProperly,
    bool? bathesAlone,
    bool? dressesAlone,
    bool? usesToothbrush,
    bool? wearsShoesAlone,
    bool? washesFaceOnWaking,
    bool? washesHandsBeforeAfterEating,
    bool? washesFeetAfterPlay,
  }) =>
      Section13Data(
        usesToiletProperly: usesToiletProperly ?? this.usesToiletProperly,
        bathesAlone: bathesAlone ?? this.bathesAlone,
        dressesAlone: dressesAlone ?? this.dressesAlone,
        usesToothbrush: usesToothbrush ?? this.usesToothbrush,
        wearsShoesAlone: wearsShoesAlone ?? this.wearsShoesAlone,
        washesFaceOnWaking: washesFaceOnWaking ?? this.washesFaceOnWaking,
        washesHandsBeforeAfterEating:
            washesHandsBeforeAfterEating ?? this.washesHandsBeforeAfterEating,
        washesFeetAfterPlay: washesFeetAfterPlay ?? this.washesFeetAfterPlay,
      );

  Map<String, dynamic> toJson() => {
        'usesToiletProperly': usesToiletProperly,
        'bathesAlone': bathesAlone,
        'dressesAlone': dressesAlone,
        'usesToothbrush': usesToothbrush,
        'wearsShoesAlone': wearsShoesAlone,
        'washesFaceOnWaking': washesFaceOnWaking,
        'washesHandsBeforeAfterEating': washesHandsBeforeAfterEating,
        'washesFeetAfterPlay': washesFeetAfterPlay,
      };

  factory Section13Data.fromJson(Map<String, dynamic> json) => Section13Data(
        usesToiletProperly: json['usesToiletProperly'] as bool?,
        bathesAlone: json['bathesAlone'] as bool?,
        dressesAlone: json['dressesAlone'] as bool?,
        usesToothbrush: json['usesToothbrush'] as bool?,
        wearsShoesAlone: json['wearsShoesAlone'] as bool?,
        washesFaceOnWaking: json['washesFaceOnWaking'] as bool?,
        washesHandsBeforeAfterEating:
            json['washesHandsBeforeAfterEating'] as bool?,
        washesFeetAfterPlay: json['washesFeetAfterPlay'] as bool?,
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
  final Section12Data? section12;
  final Section13Data? section13;
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
    this.section12,
    this.section13,
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
    Section12Data? section12,
    Section13Data? section13,
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
        section12: section12 ?? this.section12,
        section13: section13 ?? this.section13,
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
        'section12': section12?.toJson(),
        'section13': section13?.toJson(),
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
        section12: json['section12'] != null
            ? Section12Data.fromJson(
                json['section12'] as Map<String, dynamic>)
            : null,
        section13: json['section13'] != null
            ? Section13Data.fromJson(
                json['section13'] as Map<String, dynamic>)
            : null,
        isCompleted: json['isCompleted'] as bool? ?? false,
      );
}
