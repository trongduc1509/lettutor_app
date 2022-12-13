enum TutorSpeciality {
  all,
  englishForKids,
  englishForBusiness,
  conversational,
  starters,
  movers,
  flyers,
  ket,
  pet,
  ielts,
  toefl,
  toeic,
}

extension TutorSpecialityX on TutorSpeciality {
  String get mapToString {
    switch (this) {
      case TutorSpeciality.all:
        return 'All';
      case TutorSpeciality.englishForKids:
        return 'Englist for kids';
      case TutorSpeciality.englishForBusiness:
        return 'English for Business';
      case TutorSpeciality.conversational:
        return 'Conversational';
      case TutorSpeciality.starters:
        return 'STARTERS';
      case TutorSpeciality.movers:
        return 'MOVERS';
      case TutorSpeciality.flyers:
        return 'FLYERS';
      case TutorSpeciality.ket:
        return 'KET';
      case TutorSpeciality.pet:
        return 'PET';
      case TutorSpeciality.ielts:
        return 'IELTS';
      case TutorSpeciality.toefl:
        return 'TOEFL';
      case TutorSpeciality.toeic:
        return 'TOEIC';
    }
  }
}
