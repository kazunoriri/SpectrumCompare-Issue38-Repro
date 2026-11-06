# 調査の整理

2026-11-07。製品コード・Issue状態・既存PRを変更せず、問い合わせ用の独立資料を作成。

## 問い合わせの照合

送信済みのAbleton問い合わせ（2026-11-05）、同社のCycling ’74への案内（11-06）、Cycling ’74への送信文（11-06）、Christopherの返信を読み取り確認した。メール原文・宛先・ヘッダー・署名・受付用識別子は公開資料へ転載しない。

前回の共有URLは https://github.com/kazunoriri/SpectrumCompare/issues/42 。送信文はこれをpublic issueと表現していたが、GitHub APIでrepository visibility=privateを確認し、匿名HTTPアクセスも404だった。#38ではなく、挿入時の内部Undo増加を扱う#42である。リンク失敗はこの事実と整合するが、先方の画面や認証状況は観測していない。

元の質問は、(1) 可変長の内部状態を無追加UndoでALSへ永続化、(2) pattrstorageの無追加Undo保存、(3) 初期化書込みをInsert Deviceに統合、(4) 明示操作のUndo/Redoと内部管理更新の分離。今回のREADMEはこれらを維持し、#38のsource/mirror・Undo前値の質問を加えた。

## 過去の事実と適用範囲

| 資料 | 確認できたこと / 限界 |
| --- | --- |
| [Issue #38](https://github.com/kazunoriri/SpectrumCompare/issues/38)と2コメント | 5台共有設定の1操作5履歴が出発点。自動同期、1操作1履歴、保存復元、任意デバイスの自由な追加・複製・削除が要件。未解決・Open / BLOCKED。 |
| [PR #37](https://github.com/kazunoriri/SpectrumCompare/pull/37) | マージ済みの同値書込み削減。異なる値のpeer更新とUI Blob保存は残る。1履歴化の実証ではない。 |
| [PR #36](https://github.com/kazunoriri/SpectrumCompare/pull/36) | ID保存の独立PoC。数値パラメータの限定PASSは可変長peer集合の保存解決を意味しない。Draft / Open。 |
| [PR #39 Stage A結果](https://github.com/kazunoriri/SpectrumCompare/pull/39#issuecomment-6456048991) | Live 12.4.7 / Max 9.1.5、1台内5パラメータの限定PASS。独立5台ではない。Inspector目視未実施。 |
| [Stage B / B2設計](https://github.com/kazunoriri/SpectrumCompare/pull/39#issuecomment-6456596844) | 元Stage Bは操作元の旧値が残る設計をモデルでFAIL。LiveのFAILとは区別。B2はpeerのsourceへassign、別mirrorへ保存する仮説へ進んだ。 |
| [Stage B2実機報告](https://github.com/kazunoriri/SpectrumCompare/pull/39#issuecomment-6535150433) | 手動配置の2台は両起点の同期・1履歴・Undo/Redo限定PASS、3台もユーザーPASS報告。ただし非default途中参加は4096に留まりFAIL、5台・保存等は未完。生成ALSのクラッシュは手動配置成功で解決した扱いにしない。 |
| [PR #40のRESULTS.md](https://github.com/kazunoriri/SpectrumCompare/blob/cf7c1c53c3d4c0e31c56ca18f82f92e37a32d172/poc/undo-shared-settings/Stage-C/RESULTS.md)と全コメント | 初期本文のnative HOLDより後に限定PASSとFAILが追記されている。最終判断はDraft / Open、製品NO-GO。 |
| [Stage C保存Set再現](https://github.com/kazunoriri/SpectrumCompare/pull/40#issuecomment-6540378400) | 5台で4096/0%/20ms→Smooth50%→Undo1回が8192/0%/80ms。スクリーンショットに基づく過去のユーザー実機報告。 |
| [保存値調査](https://github.com/kazunoriri/SpectrumCompare/pull/40#issuecomment-6540475879) | sourceとmirrorのALS保存値が不一致。これは保存値の事実でありhost内部イベントの証明ではない。 |
| [受動トレース](https://github.com/kazunoriri/SpectrumCompare/pull/40#issuecomment-6542349529) | 同じ起点のsetting入口にfft3→smooth0→average3が到着し、それぞれ新revisionで4peerへ伝播。UIとmenu入口が合流しているため、host内呼出元・snapshot範囲は未確定。今回606行の原ログ自体は再取得できていない。 |
| [pattr数値assign報告](https://github.com/kazunoriri/SpectrumCompare/pull/40#issuecomment-6557553985) | ON/Float/float32で0、OFFで0. 2.という過去実機報告。バイナリ静的解析との整合は仮説であり、実行時atom列の原因を証明していない。今回Test 1の最終AMXDで同じ出力差を再確認。 |
| [停止判断](https://github.com/kazunoriri/SpectrumCompare/issues/38#issuecomment-6591014249) | C2の2台A起点の限定実機PASSと、遅延旧通知・偽Undo/Redo等のモデル反例を区別。反例通知列がLiveでどれほど発生するかは不明。固定代表・専用管理デバイスは不可。 |
| Issue #42用の別worktreeのDECISIONS / persistence-result.json | assign診断版の2台ともALSのUI Stateが空だったという過去結果。今回その製品診断版を流用せず、独立Test 2でruntimeと保存値を比較した。 |

上記GitHub資料は認証付き接続で閲覧した。元のStage C worktreeや未コミット報告の一部は現在存在せず、pattr専用RESULTSの既知パスはPR headで404だった。消失した原ファイルを読んだことにはせず、残るIssue/PRコメントによる裏付けと今回の独立実測を分けた。Stage Cのコミット済みRESULTS本文も取得して照合した。

## 公式仕様との関係

- [pattr.assign](https://docs.cycling74.com/reference/pattr/#assign)のfloat説明とTest 1出力が異なる。文中のstoredがALS永続保存・将来Undo前値まで保証するかは先方への質問。
- [live.menu.assign](https://docs.cycling74.com/reference/live.menu/#assign)は非保存の説明がある。Test 3のsource保存値不一致自体を仕様違反とは記載しない。
- [pattrのParameter Visibility](https://docs.cycling74.com/reference/pattr/)でVisible＋Undo OFFの数値保存が説明されるが、Blobの可変長状態を同様に保存できる根拠ではない。
- [pattrstorage](https://docs.cycling74.com/reference/pattrstorage/)のParameter Modeを、無履歴更新ができる証拠とは扱わない。今回未実測。
- [Song API](https://docs.cycling74.com/apiref/lom/song/)のcan_undo/can_redoは可否であり、通知の操作ID・方向・完了を識別する契約としては採用しない。

今回のTest 3は2台・2設定・nativeメニューのみで同種の交差Undo症状を実測した。5台全機能の受入完了、製品修正、解決方式の決定、C2リスクの解消を意味しない。
