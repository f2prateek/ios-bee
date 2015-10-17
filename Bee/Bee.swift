import Foundation

public class Bee {

  static let Table: [Character:String] = [
      "a": "Alfa",
      "b": "Bravo",
      "c": "Charlie",
      "d": "Delta",
      "e": "Echo",
      "f": "Foxtrot",
      "g": "Golf",
      "h": "Hotel",
      "i": "India",
      "j": "Juliett",
      "k": "Kilo",
      "l": "Lima",
      "m": "Mike",
      "n": "November",
      "o": "Oscar",
      "p": "Papa",
      "q": "Quebec",
      "r": "Romeo",
      "s": "Sierra",
      "t": "Tango",
      "u": "Uniform",
      "v": "Victor",
      "w": "Whiskey",
      "x": "X-ray",
      "y": "Yankee",
      "z": "Zulu",
      "1": "One",
      "2": "Two",
      "3": "Three",
      "4": "Four",
      "5": "Five",
      "6": "Six",
      "7": "Seven",
      "8": "Eight",
      "9": "Nine",
      "0": "Zero"
  ]

  public static func spell(text: String) -> String {
    var spelt = ""

    var addSpace = true
    for char in text.lowercaseString {
      if char == " " {
        if count(spelt) > 0 {
          spelt = spelt + "\n"
          addSpace = false
        }
        continue
      }

      if count(spelt) > 0 && addSpace {
        spelt = spelt + " "
      }
      addSpace = true

      var a: String?
      a = Bee.Table[char]
      if a == nil {
        a = String(char)
      }

      spelt = spelt + a!
    }

    return spelt
  }
}