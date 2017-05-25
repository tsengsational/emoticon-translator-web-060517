require 'yaml'
require 'pry'
# require modules here

lib = {
  "angel"=>["O:)", "\u261C(\u2312\u25BD\u2312)\u261E"],
  "angry"=>[">:(", "\u30FD(\uFF4F`\u76BF\u2032\uFF4F)\uFF89"],
  "bored"=>[":O", "(\u0398\u03B5\u0398;)"],
  "confused"=>["%)", "(\u309C.\u309C)"],
  "embarrased"=>[":$", "(#^.^#)"],
  "fish"=>["><>", ">\u309C))))\u5F61"],
  "glasses"=>["8D", "(^0_0^)"],
  "grinning"=>["=D", "(\uFFE3\u30FC\uFFE3)"],
  "happy"=>[":)", "(\uFF3E\uFF56\uFF3E)"],
  "kiss"=>[":*", "(*^3^)/~\u2606"],
  "sad"=>[":'(", "(\uFF34\u25BD\uFF34)"],
  "surprised"=>[":o", "o_O"],
  "wink"=>[";)", "(^_-)"]
}

def load_library(filepath)
  # code goes here
  library = YAML.load_file(filepath)
  newLibrary = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  library.each do |meaning, array|
    newLibrary["get_meaning"][array[1]] = meaning
    newLibrary["get_emoticon"][array[0]] = array[1]
  end
  newLibrary
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  lib = load_library(filepath)
  returnEmoticon = ""
  if !lib["get_emoticon"].keys.include?(emoticon)
    return "Sorry, that emoticon was not found"
  end
  lib["get_emoticon"].find do |english, japanese|
    if english == emoticon
      returnEmoticon = japanese
    end
  end
  returnEmoticon
end

def get_english_meaning(filepath, emoticon)
  # code goes here
  lib = load_library(filepath)
  returnMeaning = ""
  if !lib["get_meaning"].keys.include?(emoticon)
    return "Sorry, that emoticon was not found"
  end
  lib["get_meaning"].find do |japanese, meaning|
    if emoticon == japanese
      returnMeaning = meaning
    end
  end
  returnMeaning
end
