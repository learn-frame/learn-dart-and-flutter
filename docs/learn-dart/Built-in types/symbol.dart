/// Symbol
///
/// A Symbol object represents an operator or identifier declared in a
/// Dart program. You might never need to use symbols, but they’re invaluable
/// for APIs that refer to identifiers by name, because minification changes
/// identifier names but not identifier symbols.

void main() {
  #foo;
  #bar;

  Symbol object = new Symbol('name');
  print(object); // Symbol("name")
}
