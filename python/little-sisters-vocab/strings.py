"""Functions for creating, transforming, and adding prefixes to strings."""


def add_prefix(prefix, word):
    """Take the given word and add the 'un' prefix.

    :param prefix: str - containing the prefix.
    :param word: str - containing the root word.
    :return: str - of root word prepended with prefix.
    """

    return prefix + word


def add_prefix_un(word):
    """Take the given word and add the 'un' prefix.

    :param word: str - containing the root word.
    :return: str - of root word prepended with 'un'.
    """

    return add_prefix("un", word)


def make_word_groups(vocab_words):
    """
    Transform a list containing a prefix and words into a string
    with the prefix followed by the words with prefix prepended.

    :param vocab_words: list - of vocabulary words with prefix in first index.
    :return: str - of prefix followed by vocabulary words with
            prefix applied.

    This function takes a `vocab_words` list and returns a string
    with the prefix and the words with prefix applied, separated
     by ' :: '.

    For example: list('en', 'close', 'joy', 'lighten'),
    produces the following string: 'en :: enclose :: enjoy :: enlighten'.
    """

    prefix = vocab_words[0]
    return_strings = []
    for index, word in enumerate(vocab_words):
        if index > 0:
            word = add_prefix(prefix, word)
        return_strings.append(word)
    return " :: ".join(return_strings)


def remove_suffix_ness(word):
    """Remove the suffix from the word while keeping spelling in mind.

    :param word: str - of word to remove suffix from.
    :return: str - of word with suffix removed & spelling adjusted.

    For example: "heaviness" becomes "heavy", but "sadness" becomes "sad".
    """
    if word[-5] == "i":
        return word[:-5] + "y"
    return word[:-4]


def adjective_to_verb(sentence, index):
    """Change the adjective within the sentence to a verb.

    :param sentence: str - that uses the word in sentence.
    :param index: int - index of the word to remove and transform.
    :return: str - word that changes the extracted adjective to a verb.

    For example, ("It got dark as the sun set", 2) becomes "darken".
    """
    words = sentence.split(" ")
    word = words[index].strip(".")
    return word + "en"
