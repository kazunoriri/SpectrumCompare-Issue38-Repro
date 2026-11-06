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
      1000,
      660
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
            930,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            5,
            650,
            22
          ],
          "text": "Test 2: Stored Only pattr / Blob persistence"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            20,
            50,
            930,
            40
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            28,
            650,
            30
          ],
          "text": "Click inputs, then bang. Save the Live Set, reopen it, then bang again."
        }
      },
      {
        "box": {
          "id": "normal-label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            105,
            460,
            30
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            60,
            325,
            30
          ],
          "text": "A: normal input (control)"
        }
      },
      {
        "box": {
          "id": "normal-input0",
          "maxclass": "message",
          "patching_rect": [
            20,
            150,
            430,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            94,
            325,
            24
          ],
          "text": "alpha"
        }
      },
      {
        "box": {
          "id": "normal-input1",
          "maxclass": "message",
          "patching_rect": [
            20,
            190,
            430,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            120,
            325,
            24
          ],
          "text": "beta"
        }
      },
      {
        "box": {
          "id": "normal-read",
          "maxclass": "message",
          "patching_rect": [
            20,
            240,
            70,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            146,
            70,
            20
          ],
          "text": "bang"
        }
      },
      {
        "box": {
          "id": "normal-p",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            290,
            400,
            22
          ],
          "text": "pattr state_normal @initial baseline",
          "varname": "normal-p",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Normal state",
              "parameter_shortname": "Normal state",
              "parameter_type": 3,
              "parameter_invisible": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                "baseline"
              ]
            }
          },
          "saved_object_attributes": {
            "parameter_enable": 1,
            "type": "symbol"
          }
        }
      },
      {
        "box": {
          "id": "normal-print",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            350,
            400,
            22
          ],
          "text": "print SC38_STATE_NORMAL"
        }
      },
      {
        "box": {
          "id": "normal-set",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            400,
            120,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "normal-output",
          "maxclass": "message",
          "patching_rect": [
            20,
            445,
            430,
            30
          ],
          "presentation": 1,
          "presentation_rect": [
            95,
            146,
            240,
            20
          ],
          "text": "(click bang to read)"
        }
      },
      {
        "box": {
          "id": "assign-label",
          "maxclass": "comment",
          "patching_rect": [
            500,
            105,
            460,
            30
          ],
          "presentation": 1,
          "presentation_rect": [
            345,
            60,
            325,
            30
          ],
          "text": "B: assign symbol (scope question)"
        }
      },
      {
        "box": {
          "id": "assign-input0",
          "maxclass": "message",
          "patching_rect": [
            500,
            150,
            430,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            345,
            94,
            325,
            24
          ],
          "text": "assign alpha"
        }
      },
      {
        "box": {
          "id": "assign-input1",
          "maxclass": "message",
          "patching_rect": [
            500,
            190,
            430,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            345,
            120,
            325,
            24
          ],
          "text": "assign beta peer_A peer_B"
        }
      },
      {
        "box": {
          "id": "assign-read",
          "maxclass": "message",
          "patching_rect": [
            500,
            240,
            70,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            345,
            146,
            70,
            20
          ],
          "text": "bang"
        }
      },
      {
        "box": {
          "id": "assign-p",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            290,
            400,
            22
          ],
          "text": "pattr state_assign @initial baseline",
          "varname": "assign-p",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Assign state",
              "parameter_shortname": "Assign state",
              "parameter_type": 3,
              "parameter_invisible": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                "baseline"
              ]
            }
          },
          "saved_object_attributes": {
            "parameter_enable": 1,
            "type": "symbol"
          }
        }
      },
      {
        "box": {
          "id": "assign-print",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            350,
            400,
            22
          ],
          "text": "print SC38_STATE_ASSIGN"
        }
      },
      {
        "box": {
          "id": "assign-set",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            400,
            120,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "assign-output",
          "maxclass": "message",
          "patching_rect": [
            500,
            445,
            430,
            30
          ],
          "presentation": 1,
          "presentation_rect": [
            430,
            146,
            240,
            20
          ],
          "text": "(click bang to read)"
        }
      },
      {
        "box": {
          "id": "audio-in",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            540,
            80,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "text": "plugin~"
        }
      },
      {
        "box": {
          "id": "audio-out",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            585,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 0,
          "text": "plugout~"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "normal-input0",
            0
          ],
          "destination": [
            "normal-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normal-input1",
            0
          ],
          "destination": [
            "normal-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normal-read",
            0
          ],
          "destination": [
            "normal-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normal-p",
            0
          ],
          "destination": [
            "normal-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normal-p",
            0
          ],
          "destination": [
            "normal-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normal-set",
            0
          ],
          "destination": [
            "normal-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "assign-input0",
            0
          ],
          "destination": [
            "assign-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "assign-input1",
            0
          ],
          "destination": [
            "assign-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "assign-read",
            0
          ],
          "destination": [
            "assign-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "assign-p",
            0
          ],
          "destination": [
            "assign-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "assign-p",
            0
          ],
          "destination": [
            "assign-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "assign-set",
            0
          ],
          "destination": [
            "assign-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "audio-in",
            0
          ],
          "destination": [
            "audio-out",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "audio-in",
            1
          ],
          "destination": [
            "audio-out",
            1
          ]
        }
      }
    ],
    "parameters": {
      "parameterbanks": {},
      "inherited_shortname": 1,
      "normal-p": [
        "Normal state",
        "Normal state",
        0
      ],
      "assign-p": [
        "Assign state",
        "Assign state",
        0
      ]
    },
    "dependency_cache": [],
    "autosave": 0,
    "devicewidth": 680
  }
}
