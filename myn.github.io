<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>最高の登壇を実現するためのロードマップ</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;600;700;800;900&display=swap');

        body {
            font-family: 'Noto Sans', sans-serif;
            transition: all 0.3s ease-in-out;
        }

        .gradient-bg {
            background: linear-gradient(135deg, #0ea5e9 0%, #06b6d4 50%, #0891b2 100%);
        }

        .main-bg {
            background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 20%, #bae6fd 40%, #7dd3fc 60%, #38bdf8 80%, #0ea5e9 100%);
            min-height: 100vh;
        }

        .stage-card {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stage-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 25px 50px rgba(14, 165, 233, 0.15);
        }
        
        @media (max-width: 768px) {
            .stage-card:hover {
                transform: translateY(-4px);
            }
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .progress-line {
            position: relative;
        }

        .progress-line::after {
            content: '';
            position: absolute;
            left: 50%;
            top: 100%;
            width: 2px;
            height: 80px;
            background: linear-gradient(to bottom, #667eea, #764ba2);
            transform: translateX(-50%);
            opacity: 0.3;
        }
        
        .progress-line:last-child::after {
            display: none;
        }

        .modern-highlight {
            background: linear-gradient(120deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
            border-left: 3px solid #667eea;
        }

        .scroll-indicator {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: rgba(102, 126, 234, 0.1);
            z-index: 1000;
        }

        .scroll-progress {
            height: 100%;
            background: linear-gradient(90deg, #0ea5e9, #06b6d4);
            width: 0%;
            transition: width 0.1s ease;
        }

        .floating-action {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            z-index: 100;
        }

        .section-number {
            background: linear-gradient(135deg, #1e40af, #1e3a8a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .checklist-item {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border-radius: 12px;
        }

        .checklist-item:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: translateX(8px);
        }

        .modern-checkmark {
            width: 24px;
            height: 24px;
            border: 2px solid #0ea5e9;
            border-radius: 50%;
            position: relative;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        
        .modern-checkmark.checked {
            background: linear-gradient(135deg, #0ea5e9, #06b6d4);
            border-color: #0ea5e9;
            transform: scale(1.05);
        }
        
        .modern-checkmark.checked::after {
            content: '✓';
            color: white;
            font-size: 16px;
            font-weight: bold;
        }
        
        .step-header {
            background: linear-gradient(135deg, rgba(14, 165, 233, 0.1), rgba(6, 182, 212, 0.1));
            border-left: 4px solid #0ea5e9;
            border-radius: 16px;
        }

        .modern-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(14, 165, 233, 0.08);
            border: 1px solid rgba(14, 165, 233, 0.1);
        }

        .icon-circle {
            background: linear-gradient(135deg, #0ea5e9, #06b6d4);
            box-shadow: 0 4px 15px rgba(14, 165, 233, 0.3);
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        .feature-card {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7));
            backdrop-filter: blur(10px);
            border: 1px solid rgba(102, 126, 234, 0.1);
            border-radius: 16px;
            padding: 24px;
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 15px 35px rgba(14, 165, 233, 0.15);
        }
        
        .text-gradient {
            background: linear-gradient(135deg, #1e40af, #1e3a8a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
    </style>
</head>
<body class="main-bg">
    <div class="scroll-indicator">
        <div class="scroll-progress" id="scrollProgress"></div>
    </div>

    <header class="gradient-bg text-white py-16 md:py-24 relative overflow-hidden">
        <div class="absolute inset-0 bg-black opacity-10"></div>
        <div class="container mx-auto px-4 md:px-6 text-center relative z-10">
            <h1 class="text-2xl md:text-3xl font-black mb-4 md:mb-8 leading-tight">
                <strong>最高の登壇を実現するための<br>
                <span class="text-yellow-300 font-black">ロードマップ</span></strong>
            </h1>
            <p class="text-sm md:text-lg mb-6 md:mb-10 opacity-95 max-w-4xl mx-auto leading-relaxed font-medium">
                伝説的なプレゼンターたちの技術を凝縮し、実践的なプロフェッショナルな登壇を実現するための参考ガイド
            </p>
            <div class="glass-card rounded-2xl p-6 md:p-8 max-w-5xl mx-auto">
                <p class="text-sm md:text-base font-medium leading-relaxed text-gray-800">
                    伝説的なプレゼンターたちは、決して天賦の才能だけで成功したのではありません。<br>
                    彼らは、聴衆の心を動かすための<span class="modern-highlight px-2 md:px-3 py-1 rounded-lg font-bold text-blue-800">「科学」と「芸術」</span>を熟知していました。
                </p>
            </div>
        </div>
    </header>

    <main class="container mx-auto px-4 md:px-6 py-12 md:py-20">

        <section class="mb-16 md:mb-24">
            <div class="progress-line text-center mb-8 md:mb-16">
                <div class="icon-circle inline-flex items-center justify-center w-16 h-16 md:w-20 md:h-20 text-white rounded-2xl text-xl md:text-2xl font-black mb-4 md:mb-6">1</div>
                <h2 class="text-xl md:text-2xl font-black text-gray-800 mb-4 md:mb-6">
                    <span class="section-number">ステージ1：</span>心をつかむ準備の科学
                </h2>
                <p class="text-xs md:text-sm text-gray-600 max-w-3xl mx-auto font-medium">
                    最高の登壇は、ステージに上がる前から始まっています。このステージでは、聴衆の心を掴むための土台を築きます。
                </p>
            </div>

            <div class="space-y-6 md:space-y-8">
                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 md:mb-6 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">1</span>
                        ゴールの明確化：<br>あなたの「なぜ」を定義する
                    </h3>
                    <p class="text-gray-700 mb-6 md:mb-8 text-sm leading-relaxed font-medium">
                        登壇の目的は「話すこと」ではなく、<strong class="text-blue-800 font-bold">「聴衆に行動を起こさせること」</strong>です。
                    </p>

                    <div class="feature-grid grid-cols-1 md:grid-cols-2">
                        <div class="feature-card border-l-4 border-red-400">
                            <h4 class="font-bold text-red-800 mb-3 text-base">❌ 単なる情報伝達はNG</h4>
                            <p class="text-red-700 font-medium text-sm">「新製品の仕様を説明する」</p>
                        </div>
                        <div class="feature-card border-l-4 border-green-400">
                            <h4 class="font-bold text-green-800 mb-3 text-base">✅ 行動を促す目的</h4>
                            <p class="text-green-700 font-medium text-sm">「聴衆に新製品を試したいと思わせる」</p>
                        </div>
                    </div>
                </div>

                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 md:mb-6 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-purple-500 to-pink-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">2</span>
                        聴衆の感情を特定する：たった一つの問いかけ
                    </h3>
                    <div class="bg-gradient-to-r from-purple-50 to-pink-50 rounded-2xl p-6 md:p-8 mb-6 md:mb-8 border border-purple-100">
                        <p class="text-base md:text-lg font-bold text-gray-800 text-center leading-relaxed">
                            「聴衆に、プレゼンが終わった後、<br>どんな感情でいてほしいか？」
                        </p>
                    </div>

                    <div class="feature-grid grid-cols-1 md:grid-cols-2">
                        <div class="feature-card bg-gradient-to-br from-blue-50 to-indigo-50">
                            <h4 class="font-bold mb-3 text-base text-gray-800">🍎 スティーブ・ジョブズ</h4>
                            <p class="text-gray-700 font-medium text-sm">「製品の革新性に驚いてほしい」</p>
                        </div>
                        <div class="feature-card bg-gradient-to-br from-green-50 to-teal-50">
                            <h4 class="font-bold mb-3 text-base text-gray-800">✊ マーティン・ルーサー・キング・ジュニア</h4>
                            <p class="text-gray-700 font-medium text-sm">「より良い未来への希望を持ってほしい」</p>
                        </div>
                    </div>
                </div>

                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 md:mb-6 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-indigo-500 to-blue-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">3</span>
                        コアメッセージの洗練：すべてを凝縮した一句
                    </h3>
                    <p class="text-gray-700 mb-6 md:mb-8 leading-relaxed text-sm font-medium">
                        伝えたいメッセージを一つに絞り込み、シンプルかつ力強い<strong class="text-blue-800 font-bold">「コアメッセージ」</strong>に凝縮します。
                    </p>

                    <div class="bg-gradient-to-r from-indigo-500 to-blue-600 text-white rounded-2xl p-6 md:p-8">
                        <h4 class="font-black text-xl md:text-2xl mb-2 md:mb-4">💡 例: 「ポケットに1,000曲を。」</h4>
                        <p class="opacity-90 font-medium text-sm">専門用語を避け、誰もが理解できる言葉を選びましょう。</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-16 md:mb-24">
            <div class="progress-line text-center mb-8 md:mb-16">
                <div class="icon-circle inline-flex items-center justify-center w-16 h-16 md:w-20 md:h-20 text-white rounded-2xl text-xl md:text-2xl font-black mb-4 md:mb-6">2</div>
                <h2 class="text-xl md:text-2xl font-black text-gray-800 mb-4 md:mb-6">
                    <span class="section-number">ステージ2：</span>心を動かす構成とストーリーの芸術
                </h2>
                <p class="text-xs md:text-sm text-gray-600 max-w-3xl mx-auto font-medium">
                    あなたの熱意を聴衆に届けるには、論理的な構成と、感情に訴えかけるストーリーが必要です。
                </p>
            </div>

            <div class="space-y-6 md:space-y-8">
                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-6 md:mb-8 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-green-500 to-teal-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">1</span>
                        ストーリーの骨子を組み立てる：伝説のプレゼンターに学ぶ黄金律
                    </h3>

                    <div class="bg-gradient-to-r from-green-50 to-teal-50 rounded-2xl p-6 md:p-8 mb-6 md:mb-8 border border-green-100">
                        <h4 class="text-xl md:text-2xl font-black text-gray-800 mb-4 md:mb-6">「序破急」の法則</h4>
                        <div class="space-y-6">
                            <div class="flex flex-col md:flex-row items-start space-y-4 md:space-y-0 md:space-x-6">
                                <div class="w-12 h-12 md:w-16 md:h-16 bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-2xl flex items-center justify-center font-black text-lg flex-shrink-0">序</div>
                                <div>
                                    <h5 class="font-bold text-gray-800 text-base md:text-lg mb-2">導入</h5>
                                    <p class="text-gray-600 font-medium text-sm">聴衆の共感を呼ぶ問題提起や現状を提示します。<br>（例: 「皆さんもこんな経験はありませんか？」）</p>
                                </div>
                            </div>
                            <div class="flex flex-col md:flex-row items-start space-y-4 md:space-y-0 md:space-x-6">
                                <div class="w-12 h-12 md:w-16 md:h-16 bg-gradient-to-r from-purple-500 to-pink-600 text-white rounded-2xl flex items-center justify-center font-black text-lg flex-shrink-0">破</div>
                                <div>
                                    <h5 class="font-bold text-gray-800 text-base md:text-lg mb-2">展開</h5>
                                    <p class="text-gray-600 font-medium text-sm">その問題に対するあなたの解決策や、新しい視点を提示します。具体的なデータや事例をここで示します。</p>
                                </div>
                            </div>
                            <div class="flex flex-col md:flex-row items-start space-y-4 md:space-y-0 md:space-x-6">
                                <div class="w-12 h-12 md:w-16 md:h-16 bg-gradient-to-r from-red-500 to-orange-600 text-white rounded-2xl flex items-center justify-center font-black text-lg flex-shrink-0">急</div>
                                <div>
                                    <h5 class="font-bold text-gray-800 text-base md:text-lg mb-2">結論</h5>
                                    <p class="text-gray-600 font-medium text-sm">コアメッセージを改めて強調し、聴衆に次のアクションを促します。</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 md:mb-6 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-teal-500 to-cyan-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">2</span>
                        ビジュアルの極意：「文字」ではなく「体験」を見せる
                    </h3>
                    <p class="text-gray-700 mb-6 md:mb-8 text-sm md:text-lg font-medium">スライドはあくまであなたの言葉を補完するツールです。</p>

                    <div class="feature-grid grid-cols-1 md:grid-cols-3">
                        <div class="feature-card text-center bg-gradient-to-br from-blue-50 to-indigo-50">
                            <div class="text-3xl md:text-4xl mb-4">📝</div>
                            <h4 class="font-bold text-gray-800 mb-3 text-base md:text-lg">文字は最小限に</h4>
                            <p class="text-gray-600 font-medium text-sm">聴衆は話に集中できます</p>
                        </div>
                        <div class="feature-card text-center bg-gradient-to-br from-purple-50 to-pink-50">
                            <div class="text-3xl md:text-4xl mb-4">🖼️</div>
                            <h4 class="font-bold text-gray-800 mb-3 text-base md:text-lg">イメージで語る</h4>
                            <p class="text-gray-600 font-medium text-sm">象徴的な画像やグラフで表現</p>
                        </div>
                        <div class="feature-card text-center bg-gradient-to-br from-green-50 to-teal-50">
                            <div class="text-3xl md:text-4xl mb-4">1️⃣</div>
                            <h4 class="font-bold text-gray-800 mb-3 text-base md:text-lg">1スライド1メッセージ</h4>
                            <p class="text-gray-600 font-medium text-sm">情報過多を避ける</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-16 md:mb-24">
            <div class="text-center mb-8 md:mb-16">
                <div class="icon-circle inline-flex items-center justify-center w-16 h-16 md:w-20 md:h-20 text-white rounded-2xl text-xl md:text-2xl font-black mb-4 md:mb-6">3</div>
                <h2 class="text-xl md:text-2xl font-black text-gray-800 mb-4 md:mb-6">
                    <span class="section-number">ステージ3：</span>心に響くデリバリーの技術
                </h2>
                <p class="text-xs md:text-sm text-gray-600 max-w-3xl mx-auto font-medium">
                    どんなに素晴らしい準備も、伝え方が伴わなければ意味がありません。このステージでは、聴衆に「あなたの言葉」を届けるための技術を磨きます。
                </p>
            </div>

            <div class="space-y-6 md:space-y-8">
                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 md:mb-6 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-red-500 to-pink-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">1</span>
                        感情の自己開示：完璧な人ではなく、情熱を持った人として話す
                    </h3>
                    <p class="text-gray-700 leading-relaxed text-sm md:text-lg font-medium">
                        あなたの一次体験や、そのテーマに対する個人的な想いを語ることで、聴衆との間に信頼関係が築かれます。「私自身、こんな経験をして...」という語り口は、言葉に説得力と温かみを与えます。
                    </p>
                </div>

                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 md:mb-6 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-pink-500 to-rose-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">2</span>
                        間と声の演出：言葉の「呼吸」を操る
                    </h3>

                    <div class="feature-grid grid-cols-1 md:grid-cols-2">
                        <div class="feature-card bg-gradient-to-br from-gray-50 to-slate-50">
                            <h4 class="font-bold text-gray-800 mb-3 md:mb-4 flex items-center text-base md:text-lg">
                                <span class="text-2xl md:text-3xl mr-3">⏸️</span>「沈黙」の力
                            </h4>
                            <p class="text-gray-700 font-medium text-sm">重要なメッセージの前や後に意図的に間を置くことで、聴衆の注意を惹きつけ、メッセージに重みを持たせます。</p>
                        </div>
                        <div class="feature-card bg-gradient-to-br from-blue-50 to-indigo-50">
                            <h4 class="font-bold text-gray-800 mb-3 md:mb-4 flex items-center text-base md:text-lg">
                                <span class="text-2xl md:text-3xl mr-3">🎵</span>声の強弱と緩急
                            </h4>
                            <p class="text-gray-700 font-medium text-sm">声を大きくしたり、ひそめるように話したり、スピードを変えたりすることで、あなたの感情を表現し、聴衆を惹きつけ続けます。</p>
                        </div>
                    </div>
                </div>

                <div class="stage-card modern-card p-6 md:p-10">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 md:mb-6 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-orange-500 to-red-600 text-white rounded-xl flex items-center justify-center text-lg font-black mr-4">3</span>
                        徹底した練習とリハーサル：天才の裏にある努力
                    </h3>
                    <div class="bg-gradient-to-r from-orange-50 to-red-50 rounded-2xl p-6 md:p-8 border border-orange-100">
                        <p class="text-gray-700 leading-relaxed mb-4 md:mb-6 text-sm md:text-lg font-medium">
                            スティーブ・ジョブズはプレゼン発表の数週間前から、何度もリハーサルを重ねました。完璧なプレゼンは、アドリブではなく、綿密な計算と練習の賜物です。
                        </p>
                        <div class="bg-gradient-to-r from-orange-500 to-red-600 text-white rounded-xl p-4 md:p-6">
                            <p class="font-medium text-sm">💡 録画して自分の話し方やジェスチャーを客観的に見直すことで、改善点が見えてきます。</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-16 md:mb-24">
            <div class="text-center mb-8 md:mb-16">
                <div class="icon-circle inline-flex items-center justify-center w-16 h-16 md:w-20 md:h-20 text-white rounded-2xl text-xl md:text-2xl font-black mb-4 md:mb-6">✓</div>
                <h2 class="text-xl md:text-2xl font-black text-gray-800 mb-4 md:mb-6">
                    <span class="section-number">最高の登壇を実現するための</span>チェックリスト
                </h2>
                <p class="text-xs md:text-sm text-gray-600 max-w-3xl mx-auto font-medium">
                    プレゼン前の準備から本番、そしてその後の振り返りまで、各段階で役立つ項目を網羅的にリストアップしました。
                </p>
            </div>

            <div class="mb-12 md:mb-16">
                <div class="step-header p-6 md:p-8 mb-6 md:mb-8">
                    <h3 class="text-lg md:text-2xl font-black text-gray-800 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-2xl flex items-center justify-center text-lg font-black mr-4">1</span>
                        Step 1：準備段階
                    </h3>
                </div>

                <div class="modern-card p-6 md:p-10">
                    <div class="space-y-4 md:space-y-0">
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="prep1"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>ゴール設定：</strong>登壇後に聴衆にどのような行動を起こしてほしいか、明確になっていますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="prep2"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>感情の特定：</strong>聴衆に「驚き」「希望」「共感」など、どのような感情を持ってほしいか、決まっていますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="prep3"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>コアメッセージの洗練：</strong>プレゼン全体で伝えたい最も重要なメッセージが、シンプルで力強い1文に凝縮されていますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="prep4"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>聴衆の分析：</strong>聴衆の知識レベル、興味、ニーズを把握していますか？彼らが何を知りたいか、何を求めているかを理解していますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="prep5"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>ストーリーの骨子作成：</strong>「序破急」の法則など、聴衆を引き込むストーリーラインが設計されていますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="prep6"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>スライドの最終チェック：</strong>スライドは「1スライド1メッセージ」になっていますか？文字は最小限で、ビジュアルがメインになっていますか？
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-12 md:mb-16">
                <div class="step-header p-6 md:p-8 mb-6 md:mb-8">
                    <h3 class="text-lg md:text-2xl font-black text-gray-800 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-purple-500 to-pink-600 text-white rounded-2xl flex items-center justify-center text-lg font-black mr-4">2</span>
                        Step 2：リハーサル段階
                    </h3>
                </div>

                <div class="modern-card p-6 md:p-10">
                    <div class="space-y-4 md:space-y-0">
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="rehearsal1"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>時間配分の確認：</strong>プレゼン全体の時間配分は適切ですか？特に重要なパートに十分な時間を割いていますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="rehearsal2"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>間と緩急の確認：</strong>重要なメッセージの前後に「間」を置く場所は決まっていますか？声のトーンやスピードに変化をつける計画はありますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="rehearsal3"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>一次体験の共有：</strong>あなたの個人的な経験や感情を語るパートはありますか？聴衆との信頼関係を築くための要素が含まれていますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="rehearsal4"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>デリバリーの練習：</strong>本番と全く同じ状況で、声に出してリハーサルを行いましたか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="rehearsal5"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>録画での自己分析：</strong>プレゼンを録画して、ジェスチャー、目線、話し方の癖などを客観的に確認しましたか？
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-12 md:mb-16">
                <div class="step-header p-6 md:p-8 mb-6 md:mb-8">
                    <h3 class="text-lg md:text-2xl font-black text-gray-800 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-green-500 to-teal-600 text-white rounded-2xl flex items-center justify-center text-lg font-black mr-4">3</span>
                        Step 3：本番当日
                    </h3>
                </div>

                <div class="modern-card p-6 md:p-10">
                    <div class="space-y-4 md:space-y-0">
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="live1"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>体調と心の準備：</strong>十分な睡眠を取り、心身ともにリラックスしていますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="live2"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>会場の確認：</strong>ステージの広さ、マイクの感度、プロジェクターの映り具合などを事前に確認しましたか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="live3"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>聴衆とのアイコンタクト：</strong>プレゼン中、一部の聴衆だけでなく、会場全体に目を配ることを意識していますか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="live4"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>柔軟な対応：</strong>予期せぬトラブルや質問があった場合、慌てずに落ち着いて対応できますか？
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-12 md:mb-16">
                <div class="step-header p-6 md:p-8 mb-6 md:mb-8">
                    <h3 class="text-lg md:text-2xl font-black text-gray-800 flex items-center">
                        <span class="w-10 h-10 md:w-12 md:h-12 bg-gradient-to-r from-orange-500 to-red-600 text-white rounded-2xl flex items-center justify-center text-lg font-black mr-4">4</span>
                        Step 4：振り返り（プレゼン後）
                    </h3>
                </div>

                <div class="modern-card p-6 md:p-10">
                    <div class="space-y-4 md:space-y-0">
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="review1"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>フィードバックの収集：</strong>登壇後、聴衆から感想や改善点を聞きましたか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6 border-b border-gray-100">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="review2"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>自己評価：</strong>今回のプレゼンで良かった点、次回改善すべき点を自分で分析しましたか？
                            </div>
                        </div>
                        <div class="checklist-item flex items-start space-x-4 md:space-x-6 p-4 md:p-6">
                            <div class="modern-checkmark mt-1 flex-shrink-0" data-id="review3"></div>
                            <div class="text-gray-700 leading-relaxed cursor-pointer font-medium text-sm md:text-lg">
                                <strong>次への準備：</strong>得られたフィードバックや気づきを、今後のプレゼンに活かすための具体的な行動計画を立てましたか？
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center bg-gradient-to-r from-blue-50 to-purple-50 rounded-2xl p-6 md:p-8 border border-blue-100">
                <p class="text-gray-800 font-bold text-base md:text-lg">
                    このチェックリストを、あなたのプレゼン準備の参考としてご活用ください。
                </p>
            </div>
        </section>

        <section class="text-center bg-gradient-to-r from-blue-400 to-purple-500 text-white rounded-3xl p-10 md:p-16 shadow-2xl">
            <h2 class="text-2xl md:text-3xl font-black mb-4 md:mb-8">最高の登壇への道</h2>
            <p class="text-sm md:text-lg leading-relaxed max-w-4xl mx-auto font-medium">
                最高の登壇とは、単なるスキルではありません。それは、あなたが伝えたいことへの情熱と、聴衆への愛の表現です。このロードマップを参考に、あなた自身の「最高の登壇」を築き上げてください。
            </p>
        </section>
    </main>

    <div class="floating-action">
        <button onclick="scrollToTop()" class="bg-gradient-to-r from-indigo-500 to-purple-600 text-white p-3 md:p-4 rounded-2xl shadow-2xl hover:shadow-3xl transition-all duration-300 hover:scale-110">
            <svg class="w-5 h-5 md:w-6 md:h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
            </svg>
        </button>
    </div>

    <script>
        // スクロール進捗バー
        window.addEventListener('scroll', function() {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            const docHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrollPercent = (scrollTop / docHeight) * 100;
            document.getElementById('scrollProgress').style.width = scrollPercent + '%';
        });

        // トップへスクロール
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        }

        // チェックマークの状態を保存・復元
        function saveCheckmarkState() {
            const checkmarks = document.querySelectorAll('.modern-checkmark');
            const states = {};
            checkmarks.forEach(checkmark => {
                const id = checkmark.getAttribute('data-id');
                states[id] = checkmark.classList.contains('checked');
            });
            localStorage.setItem('presentationChecklist', JSON.stringify(states));
        }

        function loadCheckmarkState() {
            const saved = localStorage.getItem('presentationChecklist');
            if (saved) {
                const states = JSON.parse(saved);
                Object.keys(states).forEach(id => {
                    const checkmark = document.querySelector(`[data-id="${id}"]`);
                    if (checkmark && states[id]) {
                        checkmark.classList.add('checked');
                    }
                });
            }
        }

        // スムーズスクロール効果
        document.addEventListener('DOMContentLoaded', function() {
            loadCheckmarkState();

            const checkmarks = document.querySelectorAll('.modern-checkmark');
            checkmarks.forEach(checkmark => {
                checkmark.addEventListener('click', function() {
                    this.classList.toggle('checked');
                    saveCheckmarkState();
                });
            });

            const cards = document.querySelectorAll('.stage-card, .checklist-item');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, {
                threshold: 0.1
            });

            cards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                observer.observe(card);
            });
        });
    </script>
</body>
</html>
