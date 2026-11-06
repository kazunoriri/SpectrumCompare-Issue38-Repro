# Reply — not sent

Public links are below. Publication verification is recorded in SHARING.md.

## English

Hello Christopher,

Thank you for reviewing my request and offering to help. I’m sorry the previous link was inaccessible; it pointed to an issue in a private repository.

I have prepared reduced, dependency-free patches and numbered steps:

- README and results: https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro#readme
- Complete patches, M4L devices, and prepared Live Sets: https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro/releases/download/repro-20261107/SpectrumCompare-Issue38-Repro.zip

Test 3 uses just two instances and two settings. After reopening the supplied Set at FFT 8192 / Smooth 0%, changing only Smooth to 50% and undoing once also changes FFT to 4096 on both instances. Test 1 separately demonstrates the numeric `pattr assign` output discrepancy. Test 2 compares normal and assign-based Blob updates before saving and after reopening. These were observed in Live 12.4.16 with Max 9.1.5 on macOS; Test 3 was reverified after removing unused library groove data from the public Set copies.

Could you clarify the supported behavior of `pattr assign`, how to keep saved peer values and their Undo baselines consistent without extra Undo entries, and whether `pattrstorage` supports persistent internal updates without Undo? The README also asks about grouping initialization writes into Insert Device and any supported Undo notification/transaction contract.

For clarity, my earlier email concerned insertion-time bookkeeping (Issue #42); the shared-setting Undo issue is tracked separately as #38. The included tests separate these questions. Each instance must remain freely insertable, duplicable, and removable, without a permanent manager device.

Thank you for your guidance.

Best regards

## 日本語訳

Christopher様

お問い合わせをご確認いただき、ご協力のお申し出をありがとうございます。前回のリンクが閲覧できず、申し訳ありません。非公開リポジトリ内のIssueを参照していました。

外部依存のない最小パッチと、番号付きの操作手順を用意しました。

- READMEと検証結果：https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro#readme
- パッチ・M4Lデバイス・準備済みLive Set一式：https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro/releases/download/repro-20261107/SpectrumCompare-Issue38-Repro.zip

Test 3は2台・2設定だけの構成です。同梱SetをFFT 8192／Smooth 0%で再読込し、Smoothだけを50%に変更して1回Undoすると、両台のFFTも4096へ変わります。Test 1では数値`pattr assign`の出力の相違を、Test 2では通常入力とassignによるBlob更新の保存前・再読込後の差を確認できます。macOSのLive 12.4.16／Max 9.1.5で実測し、公開用Setから未使用のライブラリグルーヴを除去した後もTest 3を再確認しました。

`pattr assign`の正式な動作、余分なUndoを増やさずに同期先の保存値とUndo前値を一致させる方法、`pattrstorage`で内部更新をUndoなしに永続化できるかをご教示いただけますでしょうか。READMEには、初期化書込みをInsert Deviceへまとめる方法と、Undo通知・トランザクションの正式な契約についても質問を記載しています。

補足として、前回のメールは挿入時の内部管理更新（Issue #42）に関するもので、共有設定のUndo問題は別の#38で管理しています。同梱テストではこれらの論点を分けています。固定の管理デバイスを置かず、すべてのインスタンスを自由に追加・複製・削除できる必要があります。

どうぞよろしくお願いいたします。
