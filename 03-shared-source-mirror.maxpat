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
      780
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
            10,
            800,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            5,
            380,
            22
          ],
          "text": "Test 3: saved source vs no-Undo mirror"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            20,
            40,
            940,
            35
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            28,
            380,
            36
          ],
          "text": "Two identical instances; automatic bidirectional sync. Gates close during assign output. No permanent manager. No startup broadcast."
        }
      },
      {
        "box": {
          "id": "fft-label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            95,
            440,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            72,
            170,
            22
          ],
          "text": "FFT source / saved mirror"
        }
      },
      {
        "box": {
          "id": "fft-source",
          "maxclass": "live.menu",
          "patching_rect": [
            20,
            130,
            160,
            22
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            "float"
          ],
          "parameter_enable": 1,
          "varname": "fft-source",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "fft source",
              "parameter_shortname": "fft source",
              "parameter_type": 2,
              "parameter_invisible": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_enum": [
                "4096",
                "8192"
              ]
            }
          },
          "presentation": 1,
          "presentation_rect": [
            185,
            72,
            90,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fft-mirror",
          "maxclass": "live.menu",
          "patching_rect": [
            220,
            130,
            160,
            22
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            "float"
          ],
          "parameter_enable": 1,
          "varname": "fft-mirror",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "fft mirror",
              "parameter_shortname": "fft mirror",
              "parameter_type": 2,
              "parameter_invisible": 3,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_enum": [
                "4096",
                "8192"
              ],
              "parameter_visible_undoable": 0
            }
          },
          "presentation": 1,
          "presentation_rect": [
            285,
            72,
            90,
            22
          ],
          "ignoreclick": 1
        }
      },
      {
        "box": {
          "id": "fft-gate",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            190,
            80,
            22
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "fft-tx",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            240,
            180,
            22
          ],
          "text": "s SC38_C74_fft"
        }
      },
      {
        "box": {
          "id": "fft-rx",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            300,
            180,
            22
          ],
          "text": "r SC38_C74_fft"
        }
      },
      {
        "box": {
          "id": "fft-receive",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            345,
            90,
            22
          ],
          "text": "t b i b"
        }
      },
      {
        "box": {
          "id": "fft-close",
          "maxclass": "message",
          "patching_rect": [
            220,
            345,
            40,
            22
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "fft-open",
          "maxclass": "message",
          "patching_rect": [
            20,
            470,
            40,
            22
          ],
          "text": "1"
        }
      },
      {
        "box": {
          "id": "fft-apply",
          "maxclass": "newobj",
          "patching_rect": [
            120,
            390,
            80,
            22
          ],
          "text": "t i i"
        }
      },
      {
        "box": {
          "id": "fft-assign",
          "maxclass": "newobj",
          "patching_rect": [
            220,
            435,
            150,
            22
          ],
          "text": "prepend assign"
        }
      },
      {
        "box": {
          "id": "fft-init",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            560,
            80,
            22
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "fft-source-print",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            635,
            240,
            22
          ],
          "text": "print SC38_fft_SOURCE_#0"
        }
      },
      {
        "box": {
          "id": "fft-mirror-print",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            680,
            240,
            22
          ],
          "text": "print SC38_fft_MIRROR_#0"
        }
      },
      {
        "box": {
          "id": "smooth-label",
          "maxclass": "comment",
          "patching_rect": [
            500,
            95,
            440,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            110,
            170,
            22
          ],
          "text": "Smooth source / saved mirror"
        }
      },
      {
        "box": {
          "id": "smooth-source",
          "maxclass": "live.menu",
          "patching_rect": [
            500,
            130,
            160,
            22
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            "float"
          ],
          "parameter_enable": 1,
          "varname": "smooth-source",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "smooth source",
              "parameter_shortname": "smooth source",
              "parameter_type": 2,
              "parameter_invisible": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_enum": [
                "0%",
                "50%"
              ]
            }
          },
          "presentation": 1,
          "presentation_rect": [
            185,
            110,
            90,
            22
          ]
        }
      },
      {
        "box": {
          "id": "smooth-mirror",
          "maxclass": "live.menu",
          "patching_rect": [
            700,
            130,
            160,
            22
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            "float"
          ],
          "parameter_enable": 1,
          "varname": "smooth-mirror",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "smooth mirror",
              "parameter_shortname": "smooth mirror",
              "parameter_type": 2,
              "parameter_invisible": 3,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_enum": [
                "0%",
                "50%"
              ],
              "parameter_visible_undoable": 0
            }
          },
          "presentation": 1,
          "presentation_rect": [
            285,
            110,
            90,
            22
          ],
          "ignoreclick": 1
        }
      },
      {
        "box": {
          "id": "smooth-gate",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            190,
            80,
            22
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "smooth-tx",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            240,
            180,
            22
          ],
          "text": "s SC38_C74_smooth"
        }
      },
      {
        "box": {
          "id": "smooth-rx",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            300,
            180,
            22
          ],
          "text": "r SC38_C74_smooth"
        }
      },
      {
        "box": {
          "id": "smooth-receive",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            345,
            90,
            22
          ],
          "text": "t b i b"
        }
      },
      {
        "box": {
          "id": "smooth-close",
          "maxclass": "message",
          "patching_rect": [
            700,
            345,
            40,
            22
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "smooth-open",
          "maxclass": "message",
          "patching_rect": [
            500,
            470,
            40,
            22
          ],
          "text": "1"
        }
      },
      {
        "box": {
          "id": "smooth-apply",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            390,
            80,
            22
          ],
          "text": "t i i"
        }
      },
      {
        "box": {
          "id": "smooth-assign",
          "maxclass": "newobj",
          "patching_rect": [
            700,
            435,
            150,
            22
          ],
          "text": "prepend assign"
        }
      },
      {
        "box": {
          "id": "smooth-init",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            560,
            80,
            22
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "smooth-source-print",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            635,
            240,
            22
          ],
          "text": "print SC38_smooth_SOURCE_#0"
        }
      },
      {
        "box": {
          "id": "smooth-mirror-print",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            680,
            240,
            22
          ],
          "text": "print SC38_smooth_MIRROR_#0"
        }
      },
      {
        "box": {
          "id": "ready",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            515,
            140,
            22
          ],
          "text": "live.thisdevice"
        }
      },
      {
        "box": {
          "id": "audio-in",
          "maxclass": "newobj",
          "patching_rect": [
            700,
            515,
            80,
            22
          ],
          "text": "plugin~"
        }
      },
      {
        "box": {
          "id": "audio-out",
          "maxclass": "newobj",
          "patching_rect": [
            700,
            560,
            80,
            22
          ],
          "text": "plugout~"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "fft-source",
            0
          ],
          "destination": [
            "fft-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-gate",
            0
          ],
          "destination": [
            "fft-tx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-rx",
            0
          ],
          "destination": [
            "fft-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-receive",
            2
          ],
          "destination": [
            "fft-close",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-close",
            0
          ],
          "destination": [
            "fft-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-receive",
            0
          ],
          "destination": [
            "fft-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-open",
            0
          ],
          "destination": [
            "fft-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-receive",
            1
          ],
          "destination": [
            "fft-apply",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-apply",
            1
          ],
          "destination": [
            "fft-assign",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-assign",
            0
          ],
          "destination": [
            "fft-source",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-apply",
            0
          ],
          "destination": [
            "fft-mirror",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ready",
            0
          ],
          "destination": [
            "fft-init",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-init",
            1
          ],
          "destination": [
            "fft-mirror",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-mirror",
            0
          ],
          "destination": [
            "fft-assign",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-init",
            0
          ],
          "destination": [
            "fft-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-source",
            0
          ],
          "destination": [
            "fft-source-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fft-mirror",
            0
          ],
          "destination": [
            "fft-mirror-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-source",
            0
          ],
          "destination": [
            "smooth-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-gate",
            0
          ],
          "destination": [
            "smooth-tx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-rx",
            0
          ],
          "destination": [
            "smooth-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-receive",
            2
          ],
          "destination": [
            "smooth-close",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-close",
            0
          ],
          "destination": [
            "smooth-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-receive",
            0
          ],
          "destination": [
            "smooth-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-open",
            0
          ],
          "destination": [
            "smooth-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-receive",
            1
          ],
          "destination": [
            "smooth-apply",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-apply",
            1
          ],
          "destination": [
            "smooth-assign",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-assign",
            0
          ],
          "destination": [
            "smooth-source",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-apply",
            0
          ],
          "destination": [
            "smooth-mirror",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ready",
            0
          ],
          "destination": [
            "smooth-init",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-init",
            1
          ],
          "destination": [
            "smooth-mirror",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-mirror",
            0
          ],
          "destination": [
            "smooth-assign",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-init",
            0
          ],
          "destination": [
            "smooth-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-source",
            0
          ],
          "destination": [
            "smooth-source-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "smooth-mirror",
            0
          ],
          "destination": [
            "smooth-mirror-print",
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
      "fft-source": [
        "fft source",
        "fft source",
        0
      ],
      "fft-mirror": [
        "fft mirror",
        "fft mirror",
        0
      ],
      "smooth-source": [
        "smooth source",
        "smooth source",
        0
      ],
      "smooth-mirror": [
        "smooth mirror",
        "smooth mirror",
        0
      ]
    },
    "dependency_cache": [],
    "autosave": 0,
    "devicewidth": 400
  }
}
