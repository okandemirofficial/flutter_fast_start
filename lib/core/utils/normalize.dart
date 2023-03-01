class Normalize {
  num normalizeBetweenTwoValues(
      {required num rangeMin,
      required num rangeMax,
      required num min,
      required num max,
      required num current}) {
    assert(current >= min && current <= max,
        'normalizeBetweenTwoValues: current must be greater or equal than min and less or equal than max');
    assert(rangeMax > rangeMin && current <= max,
        'normalizeBetweenTwoValues: rangeMax must be greater than rangeMin');

    return (((current - min) / (max - min)) * (rangeMax - rangeMin)) + rangeMin;
  }

  normalizeBetween0and1(num min, num max, num current) {
    assert(current >= min && current <= max,
        'normalizeBetweenTwoValues: current must be greater or equal than min and less or equal than max');
    return (current - min) / (max - min);
  }
}
