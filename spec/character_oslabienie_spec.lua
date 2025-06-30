-- busted spec for the oslabienie trigger

describe("skrypty.character.oslabienie", function()
  it("adds progress information to the output", function()
    setWindowWrap(1000000)
    alias_func_skrypty_fake_combat("Twoje cechy sa oslabione po ostatniej smierci. By je odbudowac potrzebujesz zdobyc jeszcze minimalne postepy.")
    moveCursor(0, getLastLineNumber() - 2)
    local line = copy2decho()
    display(line)
    assert.truthy(string.find(line, "minimalne"))
    assert.truthy(string.find(line, "%[0/15%]"))
  end)
end)

