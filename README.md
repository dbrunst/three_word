
#Setup
```
ruby version 2.7.2p137
gem install rspec
```

#Run Tests
```
rspec ./specs/word_spec.rb
rspec ./specs/three_word_spec.rb

or to runn them all:
rspec ./specs/
```

#How to run program:
```
    ruby ./calculate_max.rb {file} {file}
    cat {dir/files} | ruby ./calculate_max.rb
```
#Next steps
```
  Make the word class more efficient - there is currently some unecessary repetition
  Handle more unicode characters
  Handle timeout better
  Add testing around file reading
```

#Bugs
```
  My numbers are slightly off from the example provided but can't seem to find an issue on my side
  three empty spaces are getting captured as words (16 times) that needs to be removed
```
