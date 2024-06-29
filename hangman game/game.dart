import 'dart:io';

void main() {
  
  String wordGuess = 'flutter';
  
  List<String> guessedWord = List.filled(wordGuess.length, '_');
  
  int attempts = 6; 
  
  List<String> guessedLetters = [];
  
  while (attempts > 0 && guessedWord.contains('_')) {
    
    Hangman(attempts);
    
    
    print('Word: ${guessedWord.join(' ')}');
    print('Attempts left: $attempts');
    print('Guessed letters: ${guessedLetters.join(', ')}');

    print('Guess a letter:');
    String guess = stdin.readLineSync()!.toLowerCase();
    
    if (guess.length != 1 || guessedLetters.contains(guess)) {
      print('Invalid guess. Try again.');
      continue;
    }

    guessedLetters.add(guess);
    
    bool correctGuess = false;
    for (int i = 0; i < wordGuess.length; i++) {
      if (wordGuess[i] == guess) {
        guessedWord[i] = guess;
        correctGuess = true;
      }
    }
    
    if (!correctGuess) {
      print('Incorrect guess!');
      attempts--;
    } else {
      print('Correct guess!');
    }
  }

  if (guessedWord.contains('_')) {
    print('You lose! The word was: $wordGuess');
  } else {
    print('Congratulations! You guessed the word: $wordGuess');
  }
}

void Hangman(int attempts) {
  
  List<String> hangmanShapes = [
    '''
     _______
    |/      |
    |      
    |      
    |       
    |        
    |        
    |_______
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      
    |       
    |        
    |        
    |_______
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      /|
    |       
    |        
    |        
    |_______
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      /|\\
    |       
    |        
    |        
    |_______
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      /|\\
    |       |
    |        
    |        
    |_______
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      /|\\
    |       |
    |      / 
    |        
    |_______
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      /|\\
    |       |
    |      / \\
    |        
    |_______
    '''
  ];

  print(hangmanShapes[6 - attempts]);
}
