List<List<T>> convertTo2DArray<T>(List<T> oneDArray, int elementsPerRow) {
  if (elementsPerRow <= 0) {
    return [[]];
  }

  List<List<T>> twoDArray = [];
  for (var i = 0; i < oneDArray.length; i += elementsPerRow) {
    twoDArray.add(List<T>.from(oneDArray.sublist(
      i,
      (i + elementsPerRow > oneDArray.length)
          ? oneDArray.length
          : i + elementsPerRow,
    )));
  }
  return List<List<T>>.from(twoDArray); // Ensures a new reference
}
