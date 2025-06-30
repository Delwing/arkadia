-- busted spec for the oslabienie trigger

describe("skrypty.character.oslabienie", function()
  it("adds progress information to the output", function()
    feedTriggers("\nTwoje cechy sa oslabione po ostatniej smierci. By je odbudowac potrzebujesz zdobyc jeszcze minimalne postepy.\n")
    moveCursor(0, getLastLineNumber())
    local line = copy2decho()
    assert.is_truthy(string.find(line, "minimalne"))
    assert.is_truthy(string.find(line, "%[0/15%]"))
  end)
end)

