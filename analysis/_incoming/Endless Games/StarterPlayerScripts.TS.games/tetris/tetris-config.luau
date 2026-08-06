-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {1, 0.6, 0.36, 0.216, 0.1296, 0.0778, 0.0467, 0.028, 0.0168, 0.0101, 0.006, 0.0036, 0.0022, 0.0013, 8e-04, 5e-04, 5e-04, 5e-04, 5e-04, 5e-04}
local tbl_2 = {}
tbl_2.TETRIS_CONFIG = {
    boardCols = 10,
    visibleRows = 20,
    totalRows = 24,
    cellSize = 2,
    boardCenterY = -1,
    wellFieldOfView = 23,
    holdPanelX = -15,
    nextPanelX = 15,
    previewScale = 0.55,
    nextQueueSize = 5,
    arrAccelSeconds = 0.25,
    softDropFactor = 20,
    lockDelaySeconds = 0.5,
    maxLockResets = 15,
    gravitySecondsPerRow = tbl_1,
    linesPerLevel = 10,
    maxLevel = 20,
    touchAxisLockPixels = 10,
    touchMoveCellPixels = 26,
    touchHardDropPixels = 60,
    tapMaxSeconds = 0.3,
    comboHoldSeconds = 2.5,
    dangerRows = 4,
    dangerPulseSeconds = 1.1,
    dangerTintFloor = 0.45,
    dangerFadeRate = 3,
    dangerBeatSeconds = 0.85,
    dangerBeatDubOffset = 0.14,
    clearFlashSeconds = 0.12,
    perfectClearFlashSeconds = 0.4,
    shakePerLine = 0.25,
    shakeTetris = 0.9,
    deathFlingRows = 6,
    reviveKeepRows = 10
}
return tbl_2