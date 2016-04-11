//////// KeySnail Init File

// Put all your code except special key, set*key, hook, blacklist.
// {{%PRESERVE%

// }}%PRESERVE%

//// Special key settings

key.quitKey              = "C-g"
key.helpKey              = "<f1>"
key.escapeKey            = "C-q"
key.macroStartKey        = "<f3>"
key.macroEndKey          = "<f4>"
key.suspendKey           = "<f2>"
key.universalArgumentKey = "C-u"
key.negativeArgument1Key = "C--"
key.negativeArgument2Key = "C-M--"
key.negativeArgument3Key = "M--"

//// Hooks

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

//// Key bindings

key.setGlobalKey("C-i", (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_TAB, true)
}, "Emulate a the tabulation key", true)

key.setGlobalKey("C-m", (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_RETURN, true)
}, "Generate the return key code", false)

key.setGlobalKey("C-M-r", (event) => {
  userscript.reload()
}, "Reload the initialization file", true)

key.setGlobalKey("M-x", (event, arg) => {
  ext.select(arg, event)
}, "List exts and execute selected one", true)

key.setGlobalKey("M-:", (event) => {
  command.interpreter()
}, "Command interpreter", true)

key.setGlobalKey(["<f1>", "b"], (event) => {
  key.listKeyBindings()
}, "List all keybindings", false)

key.setGlobalKey(["<f1>", "F"], (event) => {
  openHelpLink("firefox-help")
}, "Display Firefox help", false)

key.setGlobalKey(["C-x", "l"], (event) => {
  command.focusToById("urlbar")
}, "Focus to the location bar", true)

key.setGlobalKey(["C-x", "g"], (event) => {
  command.focusToById("searchbar")
}, "Focus to the search bar", true)

key.setGlobalKey(["C-x", "t"], (event) => {
  command.focusElement(command.elementsRetrieverTextarea, 0)
}, "Focus to the first textarea", true)

key.setGlobalKey(["C-x", "s"], (event) => {
  command.focusElement(command.elementsRetrieverButton, 0)
}, "Focus to the first button", true)

key.setGlobalKey([["M-w"], ["C-w"], ["C-W"]], (event) => {
  command.copyRegion(event)
}, "Copy selected text", true)

key.setGlobalKey("C-s", (event) => {
  command.iSearchForwardKs(event)
}, "Emacs like incremental search forward", true)

key.setGlobalKey("C-r", (event) => {
  command.iSearchBackwardKs(event)
}, "Emacs like incremental search backward", true)

key.setGlobalKey([["C-x", "k"], ["C-x", "C-k"]], (event) => {
  BrowserCloseTabOrWindow()
}, "Close tab / window", false)

key.setGlobalKey(["C-x", "C-c"], (event) => {
  closeWindow(true)
}, "Close the window", false)

key.setGlobalKey(["C-c", "u"], (event) => {
  undoCloseTab()
}, "Undo closed tab", false)

key.setGlobalKey(["C-x", "n"], (event) => {
  OpenBrowserWindow()
}, "Open new window", false)

key.setGlobalKey("C-o", (event) => {
  getBrowser().mTabContainer.advanceSelectedTab(1, true)
}, "Select next tab", false)

key.setGlobalKey("C-O", (event) => {
  getBrowser().mTabContainer.advanceSelectedTab(-1, true)
}, "Select previous tab", false)

key.setGlobalKey(["C-x", "C-c"], (event) => {
  goQuitApplication()
}, "Exit Firefox", true)

key.setGlobalKey(["C-x", "o"], (event, arg) => {
  command.focusOtherFrame(arg)
}, "Select next frame", false)

key.setGlobalKey(["C-x", "1"], (event) => {
  window.loadURI(event.target.ownerDocument.location.href)
}, "Show current frame only", true)

key.setGlobalKey(["C-x", "C-f"], (event) => {
  BrowserOpenFileWindow()
}, "Open the local file", true)

key.setGlobalKey(["C-x", "C-s"], (event) => {
  saveDocument(window.content.document)
}, "Save current page to the file", true)

key.setGlobalKey(["C-c", "C-c", "C-v"], (event) => {
  toJavaScriptConsole()
}, "Display JavaScript console", true)

key.setGlobalKey(["C-c", "C-c", "C-c"], (event) => {
  command.clearConsole()
}, "Clear Javascript console", true)

key.setEditKey(["C-x", "h"], (event) => {
  command.selectAll(event)
}, "Select whole text", true)

key.setEditKey([["C-SPC"], ["C-@"]], (event) => {
  command.setMark(event)
}, "Set the mark", true)

key.setEditKey([["C-x", "u"], ["C-_"], ["C-/"]], (event) => {
  display.echoStatusBar("Undo!", 2000)
  goDoCommand("cmd_undo")
}, "Undo", false)

key.setEditKey("C-\\", (event) => {
  display.echoStatusBar("Redo!", 2000)
  goDoCommand("cmd_redo")
}, "Redo", false)

key.setEditKey("C-a", (event) => {
  command.beginLine(event)
}, "Beginning of the line", false)

key.setEditKey("C-e", (event) => {
  command.endLine(event)
}, "End of the line", false)

key.setEditKey("C-f", (event) => {
  command.nextChar(event)
}, "Forward char", false)

key.setEditKey("C-b", (event) => {
  command.previousChar(event)
}, "Backward char", false)

key.setEditKey([["M-f"], ["C-F"]], (event) => {
  command.forwardWord(event)
}, "Next word", false)

key.setEditKey([["M-b"], ["C-B"]], (event) => {
  command.backwardWord(event)
}, "Previous word", false)

key.setEditKey("C-n", (event) => {
  command.nextLine(event)
}, "Next line", false)

key.setEditKey("C-p", (event) => {
  command.previousLine(event)
}, "Previous line", false)

key.setEditKey("C-v", (event) => {
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

key.setEditKey("C-d", (event) => {
  goDoCommand("cmd_deleteCharForward")
}, "Delete forward char", false)

key.setEditKey("C-h", (event) => {
  goDoCommand("cmd_deleteCharBackward")
}, "Delete backward char", false)

key.setEditKey([["M-d"], ["C-D"], ["C-delete"]], (event) => {
  command.deleteForwardWord(event)
}, "Delete forward word", false)

key.setEditKey([["M-h"], ["C-H"], ["C-<backspace>"]], (event) => {
  command.deleteBackwardWord(event)
}, "Delete backward word", false)

key.setEditKey("M-u", (event, arg) => {
  command.wordCommand(event, arg, command.upcaseForwardWord, command.upcaseBackwardWord)
}, "Convert following word to upper case", false)

key.setEditKey("M-l", (event, arg) => {
  command.wordCommand(event, arg, command.downcaseForwardWord, command.downcaseBackwardWord)
}, "Convert following word to lower case", false)

key.setEditKey("M-c", (event, arg) => {
  command.wordCommand(event, arg, command.capitalizeForwardWord, command.capitalizeBackwardWord)
}, "Capitalize the following word", false)

key.setEditKey("C-k", (event) => {
  command.killLine(event)
}, "Kill the rest of the line", false)

key.setEditKey("C-w", (event) => {
  if (!command.marked(event)) {
    command.setMark(event)
    command.backwardWord(event)
  }
  goDoCommand("cmd_copy")
  goDoCommand("cmd_delete")
  command.resetMark(event)
}, "Cut current region or backward word", true)

key.setEditKey([["M-y"], ["C-W"]], (event) => {
  goDoCommand("cmd_copy")
  command.resetMark(even)
}, "Cut current region", true)

key.setEditKey("C-y", command.yank, "Paste (yank)", true)
key.setEditKey([["M-y"], ["C-Y"]], command.yankPop, "Paste pop (yank pop)", true)

key.setEditKey("C-M-y", (event) => {
  if (!command.kill.ring.length) return
  let ct = command.getClipboardText()
  (!command.kill.ring.length || ct != command.kill.ring[0]) && command.pushKillRing(ct)
  prompt.selector({
    message: "Paste:",
    collection: command.kill.ring,
    callback: (i) => {
      if (i >= 0) key.insertText(command.kill.ring[i])
    }
  })
}, "Show kill-ring and select text to paste", true)

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

key.setEditKey("M-n", (event) => {
  command.walkInputElement(command.elementsRetrieverTextarea, true, true)
}, "Focus to the next text area", false)

key.setEditKey("M-p", (event) => {
  command.walkInputElement(command.elementsRetrieverTextarea, false, true)
}, "Focus to the previous text area", false)

key.setViewKey("x", (event) => {
  BrowserCloseTabOrWindow()
}, "Close tab / window", false)

key.setViewKey([["C-n"], ["n"]], (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_DOWN, true)
}, "Scroll line down", false)

key.setViewKey([["C-p"], ["p"]], (event) => {
  key.generateKey(event.originalTarget, KeyEvent.DOM_VK_UP, true)
}, "Scroll line up", false)

// key.setViewKey([["C-f"], ["."]], (event) => {
//   key.generateKey(event.originalTarget, KeyEvent.DOM_VK_RIGHT, true)
// }, "Scroll right", false)

// key.setViewKey([["C-b"], [","]], (event) => {
//   key.generateKey(event.originalTarget, KeyEvent.DOM_VK_LEFT, true)
// }, "Scroll left", false)

key.setViewKey([["C-v"], ["f"]], (event) => {
  goDoCommand("cmd_scrollPageDown")
}, "Scroll page down", false)

key.setViewKey([["M-v"], ["C-V"], ["b"]], (event) => {
  goDoCommand("cmd_scrollPageUp")
}, "Scroll page up", false)

key.setViewKey([["C-<"], ["g"]], (event) => {
  goDoCommand("cmd_scrollTop")
}, "Scroll to the top of the page", true)

key.setViewKey([["C->"], ["G"]], (event) => {
  goDoCommand("cmd_scrollBottom")
}, "Scroll to the bottom of the page", true)

key.setViewKey("l", (event) => {
  getBrowser().TmabContainer.advanceSelectedTab(1, true)
}, "Select next tab", false)

key.setViewKey("h", (event) => {
  getBrowser().mTabContainer.advanceSelectedTab(-1, true)
}, "Select previous tab", false)

key.setViewKey(":", (event, arg) => {
  shell.input(null, arg)
}, "List and execute commands", true)

key.setViewKey([["C-r"], ["r"]], (event) => {
  BrowserReload()
}, "Reload the page", true)

key.setViewKey([["C-b"], ["b"]], (event) => {
  BrowserBack()
}, "Back", false)

key.setViewKey([["C-f"], ["f"]], (event) => {
  BrowserForward()
}, "Forward", false)

key.setViewKey(["C-x", "h"], (event) => {
  goDoCommand("cmd_selectAll")
}, "Select all", true)

key.setViewKey("t", (event) => {
  command.focusElement(command.elementsRetrieverTextarea, 0)
}, "Focus to the first textarea", true)

key.setViewKey("M-p", (event) => {
  command.walkInputElement(command.elementsRetrieverButton, true, true)
}, "Focus to the next button", false)

key.setViewKey("M-n", (event) => {
  command.walkInputElement(command.elementsRetrieverButton, false, true)
}, "Focus to the previous button", false)

key.setCaretKey([["C-a"], ["^"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectBeginLine") : goDoCommand("cmd_beginLine")
}, "Move caret to the beginning of the line", false)

key.setCaretKey([["C-e"], ["$"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectEndLine") : goDoCommand("cmd_endLine")
}, "Move caret to the end of the line", false)

key.setCaretKey([["C-n"], ["j"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectLineNext") : goDoCommand("cmd_scrollLineDown")
}, "Move caret to the next line", false)

key.setCaretKey([["C-p"], ["k"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectLinePrevious") : goDoCommand("cmd_scrollLineUp")
}, "Move caret to the previous line", false)

key.setCaretKey([["C-f"], ["l"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectCharNext") : goDoCommand("cmd_scrollRight")
}, "Move caret to the right", false)

key.setCaretKey([["C-b"], ["h"], ["C-h"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectCharPrevious") : goDoCommand("cmd_scrollLeft")
}, "Move caret to the left", false)

key.setCaretKey([["M-f"], ["w"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectWordNext") : goDoCommand("cmd_wordNext")
}, "Move caret to the right by word", false)

key.setCaretKey([["M-b"], ["W"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectWordPrevious") : goDoCommand("cmd_wordPrevious")
}, "Move caret to the left by word", false)

key.setCaretKey([["C-v"], ["SPC"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectPageNext") : goDoCommand("cmd_movePageDown")
}, "Move caret down by page", false)

key.setCaretKey([["M-v"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectPagePrevious") : goDoCommand("cmd_movePageUp")
}, "Move caret up by page", false)

key.setCaretKey([["M-<"], ["g"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectTop") : goDoCommand("cmd_scrollTop")
}, "Move caret to the top of the page", false)

key.setCaretKey([["M->"], ["G"]], (event) => {
  event.target.ksMarked ? goDoCommand("cmd_selectEndLine") : goDoCommand("cmd_endLine")
}, "Move caret to the end of the line", false)

key.setCaretKey("J", (event) => {
  util.getSelectionController().scrollLine(true)
}, "Scroll line down", false)

key.setCaretKey("K", (event) => {
  util.getSelectionController().scrollLine(false)
}, "Scroll line up", false)

key.setCaretKey(",", (event) => {
  util.getSelectionController().scrollHorizontal(true)
  goDoCommand("cmd_scrollLeft")
}, "Scroll left", false)

key.setCaretKey(".", (event) => {
  goDoCommand("cmd_scrollRight")
  util.getSelectionController().scrollHorizontal(false)
}, "Scroll right", false)

key.setCaretKey("z", (event) => {
  command.recenter(event)
}, "Scroll to the cursor position", false)

key.setCaretKey([["C-SPC"], ["C-@"]], (event) => {
  command.setMark(event)
}, "Set the mark", true)

key.setCaretKey(":", (event, arg) => {
  shell.input(null, arg)
}, "List and execute commands", true)

key.setCaretKey("R", (event) => {
  BrowserReload()
}, "Reload the page", true)

key.setCaretKey("B", (event) => {
  BrowserBack()
}, "Back", false)

key.setCaretKey("F", (event) => {
  BrowserForward()
}, "Forward", false)

key.setCaretKey(["C-x", "h"], (event) => {
  goDoCommand("cmd_selectAll")
}, "Select all", true)

key.setCaretKey("t", (event) => {
  command.focusElement(command.elementsRetrieverTextarea, 0)
}, "Focus to the first textarea", true)

key.setCaretKey("M-p", (event) => {
  command.walkInputElement(command.elementsRetrieverButton, true, true)
}, "Focus to the next button", false)

key.setCaretKey("M-n", (event) => {
  command.walkInputElement(command.elementsRetrieverButton, false, true)
}, "Focus to the previous button", false)
