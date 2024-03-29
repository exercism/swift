import Foundation

func isPangram(_ text: String) -> Bool {
  let lowercasedText = text.folding(options: .diacriticInsensitive, locale: .current).lowercased()

  for letter in "abcdefghijklmnopqrstuvwxyz" {
    if lowercasedText.contains(String(letter)) == false {
      return false
    }
  }

  return true
}
