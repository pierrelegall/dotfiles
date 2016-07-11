// KeySnail init file

// {{%PRESERVE%
// Put all your code except special key, set*key, hook, blacklist.

// * Functions

function isRegionActive() {
  let selection = document.commandDispatcher.focusedElement.ksMarked
  if (selection == null) return false
  else return true
}

// * My commands

let myCommand = {
  copyRegion: function (event) {
    goDoCommand("cmd_copy")
    command.resetMark(event)
  },

  killRegion: function (event) {
    goDoCommand("cmd_copy")
    goDoCommand("cmd_delete")
    command.resetMark(event)
  },

  killLineOrRegion: function (event) {
    if (isRegionActive()) myCommand.killRegion(event)
    else command.killLine(event)
  }
}

// }}%PRESERVE%

// * Special key settings

key.quitKey              = "C-g"
key.helpKey              = "<f1>"
key.escapeKey            = "C-Q"
key.macroStartKey        = "<f3>"
key.macroEndKey          = "<f4>"
key.suspendKey           = "<f2>"
key.universalArgumentKey = "C-u"
key.negativeArgument1Key = "C-U"
key.negativeArgument2Key = "C-M--"
key.negativeArgument3Key = "M--"

// Hooks

hook.addToHook("KeyBoardQuit", function (event) {
  if (key.currentKeySequence.length) return
  command.closeFindBar()
  let marked = command.marked(event)
  if (util.isCaretEnabled()) {
    if (marked) {
      command.resetMark(event)
    } else {
      if ("blur" in event.target) event.target.blur()
      gBrowser.focus()
      _content.focus()
    }
  } else {
    goDoCommand("cmd_selectNone")
  }
  if (KeySnail.windowType === "navigator:browser" && !marked) {
    key.generateKey(event.originalTarget, KeyEvent.DOM_VK_ESCAPE, true)
  }
})

// * Key bindings

// ** Global bindings

key.setGlobalKey(["<f12>"], (event) => {
  userscript.reload()
}, "Reload the initialization file", true)

key.setGlobalKey([["M-x"], ["C-;"]], (event) => {
  command.interpreter()
}, "Command interpreter", true)

key.setGlobalKey(["C-:"], (event, arg) => {
  ext.select(arg, event)
}, "List exts and execute selected one", true)

key.setGlobalKey(["C-i"], (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_TAB, true)
}, "Emulate a the tabulation key", true)

key.setGlobalKey(["C-m"], (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_RETURN, true)
}, "Generate the return key code", false)

key.setGlobalKey(["<f1>", "b"], (event) => {
  key.listKeyBindings()
}, "List all keybindings", false)

key.setGlobalKey(["<f1>", "F"], (event) => {
  openHelpLink("firefox-help")
}, "Display Firefox help", false)

key.setGlobalKey(["C-l"], (event) => {
  command.focusToById("urlbar")
}, "Focus to the location bar", true)

key.setGlobalKey(["C-x", "s"], (event) => {
  command.focusToById("searchbar")
}, "Focus to the search bar", true)

key.setGlobalKey(["C-x", "t"], (event) => {
  command.focusElement(command.elementsRetrieverTextarea, 0)
}, "Focus to the first textarea", true)

key.setGlobalKey(["C-x", "b"], (event) => {
  command.focusElement(command.elementsRetrieverButton, 0)
}, "Focus to the first button", true)

key.setGlobalKey(["C-w"], (event) => {
  command.copyRegion(event)
}, "Copy selected text", true)

key.setGlobalKey(["C-s"], (event) => {
  command.iSearchForwardKs(event)
}, "Emacs like incremental search forward", true)

key.setGlobalKey(["C-r"], (event) => {
  command.iSearchBackwardKs(event)
}, "Emacs like incremental search backward", true)

key.setGlobalKey([["C-q"], ["C-x", "C-k"]], (event) => {
  BrowserCloseTabOrWindow()
}, "Close tab / window", false)

key.setGlobalKey([["C-Q"], ["C-x", "C-c"]], (event) => {
  closeWindow(true)
}, "Close the window", false)

key.setGlobalKey([["C-o"], ["C-x", "o"]], (event) => {
  getBrowser().mTabContainer.advanceSelectedTab(1, true)
}, "Select next tab", false)

key.setGlobalKey([["C-O"], ["C-x", "o"]], (event) => {
  getBrowser().mTabContainer.advanceSelectedTab(-1, true)
}, "Select previous tab", false)

key.setGlobalKey(["C-x", "C-f"], (event) => {
  BrowserOpenFileWindow()
}, "Open a local file", true)

key.setGlobalKey(["C-x", "C-s"], (event) => {
  saveDocument(window.content.document)
}, "Save current page to the file", true)

key.setGlobalKey(["C-c", "C-c", "C-v"], (event) => {
  toJavaScriptConsole()
}, "Display JS console", true)

key.setGlobalKey(["C-c", "C-c", "C-c"], (event) => {
  command.clearConsole()
}, "Clear JS console", true)

// ** Edit bindings

key.setEditKey(["C-x", "h"], (event) => {
  command.selectAll(event)
}, "Select whole text", true)

key.setEditKey([["C-SPC"], ["C-@"]], (event) => {
  command.setMark(event)
}, "Set the mark", true)

key.setEditKey(["C-/"], (event) => {
  display.echoStatusBar("Undo!", 2000)
  goDoCommand("cmd_undo")
}, "Undo", false)

key.setEditKey(["C-?"], (event) => {
  display.echoStatusBar("Redo!", 2000)
  goDoCommand("cmd_redo")
}, "Redo", false)

key.setEditKey(["C-a"], (event) => {
  command.beginLine(event)
}, "Beginning of the line", false)

key.setEditKey(["C-e"], (event) => {
  command.endLine(event)
}, "End of the line", false)

key.setEditKey(["C-f"], (event) => {
  command.nextChar(event)
}, "Forward char", false)

key.setEditKey(["C-b"], (event) => {
  command.previousChar(event)
}, "Backward char", false)

key.setEditKey([["M-f"], ["C-F"]], (event) => {
  command.forwardWord(event)
}, "Next word", false)

key.setEditKey([["M-b"], ["C-B"]], (event) => {
  command.backwardWord(event)
}, "Previous word", false)

key.setEditKey(["C-n"], (event) => {
  command.nextLine(event)
}, "Next line", false)

key.setEditKey(["C-p"], (event) => {
  command.previousLine(event)
}, "Previous line", false)

key.setEditKey(["C-v"], (event) => {
  command.pageDown(event)
}, "Page down", false)

key.setEditKey([["M-v"], ["C-V"]], (event) => {
  command.pageUp(event)
}, "Page up", false)

key.setEditKey([["M-<"], ["C-<"]], (event) => {
  command.moveTop(event)
}, "Beginning of the text area", false)

key.setEditKey([["M->"], ["C->"]], (event) => {
  command.moveBottom(event)
}, "End of the text area", false)

key.setEditKey(["C-d"], (event) => {
  goDoCommand("cmd_deleteCharForward")
}, "Delete forward char", false)

key.setEditKey(["C-h"], (event) => {
  goDoCommand("cmd_deleteCharBackward")
}, "Delete backward char", false)

key.setEditKey([["M-d"], ["C-D"], ["C-delete"]], (event) => {
  command.deleteForwardWord(event)
}, "Delete forward word", false)

key.setEditKey([["M-h"], ["C-H"], ["C-<backspace>"]], (event) => {
  command.deleteBackwardWord(event)
}, "Delete backward word", false)

key.setEditKey(["M-u"], (event, arg) => {
  command.wordCommand(event, arg, command.upcaseForwardWord, command.upcaseBackwardWord)
}, "Convert following word to upper case", false)

key.setEditKey(["M-l"], (event, arg) => {
  command.wordCommand(event, arg, command.downcaseForwardWord, command.downcaseBackwardWord)
}, "Convert following word to lower case", false)

key.setEditKey(["M-c"], (event, arg) => {
  command.wordCommand(event, arg, command.capitalizeForwardWord, command.capitalizeBackwardWord)
}, "Capitalize the following word", false)

key.setEditKey(["C-w"], (event) => {
  myCommand.copyRegion(event)
}, "Copy current region", true)

key.setEditKey(["C-W"], (event) => {
  myCommand.killRegion(event)
}, "Cut current region", true)

key.setEditKey(["C-k"], (event) => {
  myCommand.killLineOrRegion(event)
}, "Cut line or region", true)

key.setEditKey(["C-y"], command.yank, "Paste (yank)", true)
key.setEditKey(["C-Y"], command.yankPop, "Paste pop (yank pop)", true)

key.setEditKey(["C-x", "r", "d"], (event, arg) => {
  command.replaceRectangle(event.originalTarget, "", false, !arg)
}, "Delete text in the region-rectangle", true)

key.setEditKey(["C-x", "r", "t"], (event) => {
  prompt.read("String rectangle: ", (string, input) => {
    command.replaceRectangle(input, string)
  }, event.originalTarget)
}, "Replace text in the region-rectangle with user inputted string", true)

key.setEditKey(["C-x", "r", "o"], (event) => {
  command.openRectangle(event.originalTarget)
}, "Blank out the region-rectangle, shifting text right", true)

key.setEditKey(["C-x", "r", "k"], (event, arg) => {
  command.kill.buffer = command.killRectangle(event.originalTarget, !arg)
}, "Delete the region-rectangle and save it as the last killed one", true)

key.setEditKey(["C-x", "r", "y"], (event) => {
  command.yankRectangle(event.originalTarget, command.kill.buffer)
}, "Yank the last killed rectangle with upper left corner at point", true)

key.setEditKey(["M-n"], (event) => {
  command.walkInputElement(command.elementsRetrieverTextarea, true, true)
}, "Focus to the next text area", false)

key.setEditKey(["M-p"], (event) => {
  command.walkInputElement(command.elementsRetrieverTextarea, false, true)
}, "Focus to the previous text area", false)

// ** View bindings

key.setViewKey(["q"], (event) => {
  BrowserCloseTabOrWindow()
}, "Close tab / window", false)

key.setViewKey(["l"], (event) => {
  command.focusToById("urlbar")
}, "Focus to the location bar", true)

key.setViewKey(["n"], (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_DOWN, true)
}, "Scroll line down", false)

key.setViewKey(["p"], (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_UP, true)
}, "Scroll line up", false)

key.setViewKey(["v"], (event) => {
  goDoCommand("cmd_scrollPageDown")
}, "Scroll page down", false)

key.setViewKey(["V"], (event) => {
  goDoCommand("cmd_scrollPageUp")
}, "Scroll page up", false)

key.setViewKey(["<"], (event) => {
  goDoCommand("cmd_scrollTop")
}, "Scroll to the top of the page", true)

key.setViewKey([">"], (event) => {
  goDoCommand("cmd_scrollBottom")
}, "Scroll to the bottom of the page", true)

key.setViewKey(["j"], (event) => {
  getBrowser().mTabContainer.advanceSelectedTab(-1, true)
}, "Select previous tab", false)

key.setViewKey(["J"], (event) => {
  getBrowser().TmabContainer.advanceSelectedTab(1, true)
}, "Select next tab", false)

key.setViewKey([";"], (event, arg) => {
  shell.input(null, arg)
}, "List and execute commands", true)

key.setViewKey(["r"], (event) => {
  BrowserReload()
}, "Reload the page", true)

key.setViewKey(["b"], (event) => {
  BrowserBack()
}, "Back", false)

key.setViewKey(["f"], (event) => {
  BrowserForward()
}, "Forward", false)

key.setViewKey(["C-r"], (event) => {
  command.iSearchBackward(event)
}, "Emacs like incremental search backward", true)

key.setViewKey(["C-s"], (event) => {
  command.iSearchForward(event)
}, "Emacs like incremental search forward", true)

// * Plugins

// ** HoK

hook.addToHook("PluginLoaded", () => {
  if (!plugins.hok) return

  key.setGlobalKey(["C-c", "C-f"], (event, arg) => {
    ext.exec("hok-start-foreground-mode", arg)
  }, "Hok - Foreground hint mode", true)

  key.setGlobalKey(["C-c", "C-b"] , (event, arg) => {
    ext.exec("hok-start-background-mode", arg)
  }, "HoK - Background hint mode", true)

  key.setGlobalKey(["C-c", "C-y"], (event, arg) => {
    ext.exec("hok-yank-foreground-mode", arg)
  }, "HoK - Background hint mode", true)

  key.setViewKey(["o"], (event, arg) => {
    ext.exec("hok-start-foreground-mode", arg)
  }, "Hok - Foreground hint mode", true)

  key.setViewKey(["O"], (event, arg) => {
    ext.exec("hok-start-background-mode", arg)
  }, "HoK - Background hint mode", true)
})

// ** Tanything

hook.addToHook("PluginLoaded", () => {
  // if (!plugins.tanything) return

  key.setGlobalKey(["C-x", "b"], (event, arg) => {
    ext.exec("tanything", arg)
  }, "Tanything - View all tabs", true)

  key.setViewKey(["t"], (event, arg) => {
    ext.exec("tanything", arg)
  }, "Tanything - View all tabs", true)
})
