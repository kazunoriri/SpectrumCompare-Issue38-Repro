{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 1,
      "revision": 5,
      "architecture": "arm64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      80,
      80,
      970,
      500
    ],
    "openinpresentation": 1,
    "default_fontsize": 12,
    "default_fontname": "Arial",
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            20,
            15,
            900,
            24
          ],
          "text": "Test 1: unbound pattr - numeric assign (no audio, no scripts)"
        }
      },
      {
        "box": {
          "id": "instructions",
          "maxclass": "comment",
          "patching_rect": [
            20,
            50,
            920,
            40
          ],
          "text": "Lock patch. In EACH lane click 0., then assign 2., then bang. Compare complete output and atom count. Normal 2. is the control."
        }
      },
      {
        "box": {
          "id": "OFF-label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            100,
            440,
            22
          ],
          "text": "Parameter OFF / float32",
          "presentation": 1,
          "presentation_rect": [
            10,
            25,
            320,
            22
          ]
        }
      },
      {
        "box": {
          "id": "OFF-m0",
          "maxclass": "message",
          "patching_rect": [
            20,
            145,
            95,
            22
          ],
          "text": "0.",
          "presentation": 1,
          "presentation_rect": [
            10,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "OFF-m1",
          "maxclass": "message",
          "patching_rect": [
            125,
            145,
            95,
            22
          ],
          "text": "2.",
          "presentation": 1,
          "presentation_rect": [
            90,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "OFF-m2",
          "maxclass": "message",
          "patching_rect": [
            230,
            145,
            95,
            22
          ],
          "text": "assign 2.",
          "presentation": 1,
          "presentation_rect": [
            170,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "OFF-m3",
          "maxclass": "message",
          "patching_rect": [
            335,
            145,
            95,
            22
          ],
          "text": "bang",
          "presentation": 1,
          "presentation_rect": [
            250,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "OFF-p",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            205,
            430,
            22
          ],
          "text": "pattr numeric_off @type float32 @initial 0.",
          "saved_object_attributes": {
            "parameter_enable": 0,
            "type": "float32"
          }
        }
      },
      {
        "box": {
          "id": "OFF-print",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            265,
            200,
            22
          ],
          "text": "print SC38_OFF"
        }
      },
      {
        "box": {
          "id": "OFF-set",
          "maxclass": "newobj",
          "patching_rect": [
            240,
            265,
            120,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "OFF-output",
          "maxclass": "message",
          "patching_rect": [
            20,
            310,
            420,
            30
          ],
          "text": "(output)",
          "presentation": 1,
          "presentation_rect": [
            10,
            85,
            260,
            22
          ]
        }
      },
      {
        "box": {
          "id": "OFF-len",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            365,
            65,
            22
          ],
          "text": "zl len"
        }
      },
      {
        "box": {
          "id": "OFF-count",
          "maxclass": "number",
          "patching_rect": [
            120,
            365,
            65,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            280,
            85,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "ON-label",
          "maxclass": "comment",
          "patching_rect": [
            490,
            100,
            440,
            22
          ],
          "text": "Parameter ON / Float / Stored Only",
          "presentation": 1,
          "presentation_rect": [
            340,
            25,
            320,
            22
          ]
        }
      },
      {
        "box": {
          "id": "ON-m0",
          "maxclass": "message",
          "patching_rect": [
            490,
            145,
            95,
            22
          ],
          "text": "0.",
          "presentation": 1,
          "presentation_rect": [
            340,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "ON-m1",
          "maxclass": "message",
          "patching_rect": [
            595,
            145,
            95,
            22
          ],
          "text": "2.",
          "presentation": 1,
          "presentation_rect": [
            420,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "ON-m2",
          "maxclass": "message",
          "patching_rect": [
            700,
            145,
            95,
            22
          ],
          "text": "assign 2.",
          "presentation": 1,
          "presentation_rect": [
            500,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "ON-m3",
          "maxclass": "message",
          "patching_rect": [
            805,
            145,
            95,
            22
          ],
          "text": "bang",
          "presentation": 1,
          "presentation_rect": [
            580,
            55,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "ON-p",
          "maxclass": "newobj",
          "patching_rect": [
            490,
            205,
            430,
            22
          ],
          "text": "pattr numeric_on @type float32 @initial 0.",
          "varname": "ON-p",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Numeric ON",
              "parameter_shortname": "Numeric ON",
              "parameter_type": 0,
              "parameter_invisible": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_mmin": 0,
              "parameter_mmax": 10
            }
          },
          "saved_object_attributes": {
            "parameter_enable": 1,
            "type": "float32"
          }
        }
      },
      {
        "box": {
          "id": "ON-print",
          "maxclass": "newobj",
          "patching_rect": [
            490,
            265,
            200,
            22
          ],
          "text": "print SC38_ON"
        }
      },
      {
        "box": {
          "id": "ON-set",
          "maxclass": "newobj",
          "patching_rect": [
            710,
            265,
            120,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "ON-output",
          "maxclass": "message",
          "patching_rect": [
            490,
            310,
            420,
            30
          ],
          "text": "(output)",
          "presentation": 1,
          "presentation_rect": [
            340,
            85,
            260,
            22
          ]
        }
      },
      {
        "box": {
          "id": "ON-len",
          "maxclass": "newobj",
          "patching_rect": [
            490,
            365,
            65,
            22
          ],
          "text": "zl len"
        }
      },
      {
        "box": {
          "id": "ON-count",
          "maxclass": "number",
          "patching_rect": [
            590,
            365,
            65,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            610,
            85,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            20,
            425,
            910,
            40
          ],
          "text": "Read the full list: a number box alone would hide an unexpected second atom. Live Undo and ALS persistence require Test 2 in Live."
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "OFF-m0",
            0
          ],
          "destination": [
            "OFF-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-m1",
            0
          ],
          "destination": [
            "OFF-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-m2",
            0
          ],
          "destination": [
            "OFF-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-m3",
            0
          ],
          "destination": [
            "OFF-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-p",
            0
          ],
          "destination": [
            "OFF-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-p",
            0
          ],
          "destination": [
            "OFF-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-set",
            0
          ],
          "destination": [
            "OFF-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-p",
            0
          ],
          "destination": [
            "OFF-len",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "OFF-len",
            0
          ],
          "destination": [
            "OFF-count",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-m0",
            0
          ],
          "destination": [
            "ON-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-m1",
            0
          ],
          "destination": [
            "ON-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-m2",
            0
          ],
          "destination": [
            "ON-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-m3",
            0
          ],
          "destination": [
            "ON-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-p",
            0
          ],
          "destination": [
            "ON-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-p",
            0
          ],
          "destination": [
            "ON-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-set",
            0
          ],
          "destination": [
            "ON-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-p",
            0
          ],
          "destination": [
            "ON-len",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ON-len",
            0
          ],
          "destination": [
            "ON-count",
            0
          ]
        }
      }
    ],
    "parameters": {
      "parameterbanks": {},
      "inherited_shortname": 1,
      "ON-p": [
        "Numeric ON",
        "Numeric ON",
        0
      ]
    },
    "dependency_cache": [],
    "autosave": 0,
    "devicewidth": 660
  }
}
